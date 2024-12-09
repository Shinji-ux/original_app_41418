document.addEventListener('DOMContentLoaded', () => {
  // 初期化
  initializeEvents();

  // フィールドセットを追加するボタンのイベント
  document.getElementById('add-form-set').addEventListener('click', function () {
    addNewFields();
  });

  // 合計価格を更新する関数
  function updateTotalPrice() {
    let totalPrice = 0;
    document.querySelectorAll('.sell-item').forEach(sellItem => {
      const itemTotalPriceInput = sellItem.querySelector('.item-total-price');
      const itemTotalPrice = parseFloat(itemTotalPriceInput.value) || 0;
      totalPrice += itemTotalPrice;
    });
    document.querySelector('input[name="sell[total_price]"]').value = totalPrice;
  }

  // イベント初期化の関数
  function initializeEvents() {
    document.querySelectorAll('.sell-category-select').forEach(categorySelect => {
      categorySelect.addEventListener('change', event => {
        const categoryId = event.target.value;
        const sellItem = event.target.closest('.sell-item');
        const itemSelect = sellItem.querySelector('.sell-item-select');
        const unitSpan = sellItem.querySelector('.table-unit');
        const itemPriceInput = sellItem.querySelector('.item-price');
        const itemTotalPriceInput = sellItem.querySelector('.item-total-price');
        const quantityInput = sellItem.querySelector('.quantity-input');

        itemSelect.innerHTML = '<option value="">商品を選択</option>';
        itemPriceInput.value = '';
        unitSpan.textContent = '--';
        itemTotalPriceInput.value = '';
        quantityInput.value = '';
        updateTotalPrice(); // 合計価格を更新

        if (categoryId) {
          fetch(`/categories/${categoryId}/items`)
            .then(response => response.json())
            .then(data => {
              data.items.forEach(item => {
                const option = document.createElement('option');
                option.value = item.id;
                option.textContent = item.item_name;
                itemSelect.appendChild(option);
              });
            })
            .catch(error => console.error('Error fetching items:', error));
        }
      });
    });

    document.querySelectorAll('.sell-item-select').forEach(itemSelect => {
      itemSelect.addEventListener('change', event => {
        const itemId = event.target.value;
        const sellItem = event.target.closest('.sell-item');
        const itemPriceInput = sellItem.querySelector('.item-price');
        const unitSpan = sellItem.querySelector('.table-unit');
        const itemTotalPriceInput = sellItem.querySelector('.item-total-price');
        const quantityInput = sellItem.querySelector('.quantity-input');
        let itemPrice = 0;

        itemPriceInput.value = ''; // リセット
        unitSpan.textContent = '--';
        itemTotalPriceInput.value = ''; // リセット
        quantityInput.value = '';
        updateTotalPrice(); // 合計価格を更新

        if (itemId) {
          fetch(`/items/${itemId}/details`)
            .then(response => response.json())
            .then(data => {
              itemPrice = data.price;
              unitSpan.textContent = data.unit;
              itemPriceInput.value = itemPrice;
              updateItemTotalPrice(sellItem, itemPrice);
            })
            .catch(error => console.error('Error fetching item details:', error));
        }
      });
    });

    document.querySelectorAll('.quantity-input').forEach(quantityInput => {
      quantityInput.addEventListener('input', event => {
        const sellItem = event.target.closest('.sell-item');
        const itemPrice = parseFloat(sellItem.querySelector('.item-price').value) || 0;
        updateItemTotalPrice(sellItem, itemPrice);
      });
    });

    // item-price に対してもイベントリスナーを追加
    document.querySelectorAll('.item-price').forEach(itemPriceInput => {
      itemPriceInput.addEventListener('input', event => {
        const sellItem = event.target.closest('.sell-item');
        const itemPrice = parseFloat(itemPriceInput.value) || 0;
        updateItemTotalPrice(sellItem, itemPrice);
      });
    });
  }

  // フィールドセット追加
  function addNewFields() {
    const existingSellItems = document.querySelectorAll('.sell-item');
    const newFields = existingSellItems[0].cloneNode(true);
    const newIndex = existingSellItems.length;

    newFields.querySelectorAll('input, select').forEach(input => {
      const name = input.getAttribute('name').replace(/\d+/, newIndex);
      const id = input.getAttribute('id').replace(/\d+/, newIndex);
      input.setAttribute('name', name);
      input.setAttribute('id', id);
      input.value = '';
    });

    newFields.querySelector('.table-unit').textContent = '--';
    document.getElementById('sell-item-forms').appendChild(newFields);
    initializeEvents();
  }

  // アイテムの合計価格を更新
  function updateItemTotalPrice(sellItem, itemPrice) {
    const quantityInput = sellItem.querySelector('.quantity-input');
    const itemTotalPriceInput = sellItem.querySelector('.item-total-price');
    const quantity = parseFloat(quantityInput.value) || 0;
    itemTotalPriceInput.value = (itemPrice * quantity);
    updateTotalPrice(); // 合計価格を更新
  }
});