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
    document.querySelectorAll('.buy-item').forEach(buyItem => {
      const itemPriceInput = buyItem.querySelector('.item-price');
      const itemPrice = parseFloat(itemPriceInput.value) || 0;
      totalPrice += itemPrice;
    });
    document.querySelector('input[name="buy[total_price]"]').value = totalPrice;
  }

  // イベント初期化の関数
  function initializeEvents() {
    document.querySelectorAll('.category-select').forEach(categorySelect => {
      categorySelect.addEventListener('change', event => {
        const categoryId = event.target.value;
        const buyItem = event.target.closest('.buy-item');
        const itemSelect = buyItem.querySelector('.item-select');
        const unitSpan = buyItem.querySelector('#unit');
        const itemPriceInput = buyItem.querySelector('.item-price');
        const quantityInput = buyItem.querySelector('.quantity-input');

        itemSelect.innerHTML = '<option value="">商品を選択</option>';
        itemPriceInput.value = '';
        unitSpan.textContent = '--';
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

    document.querySelectorAll('.item-select').forEach(itemSelect => {
      itemSelect.addEventListener('change', event => {
        const itemId = event.target.value;
        const buyItem = event.target.closest('.buy-item');
        const itemPriceInput = buyItem.querySelector('.item-price');
        const unitSpan = buyItem.querySelector('#unit');
        const quantityInput = buyItem.querySelector('.quantity-input');
        let itemPrice = 0;

        itemPriceInput.value = ''; // リセット
        unitSpan.textContent = '--';
        updateTotalPrice(); // 合計価格を更新

        if (itemId) {
          fetch(`/items/${itemId}/details`)
            .then(response => response.json())
            .then(data => {
              itemPrice = data.price;
              unitSpan.textContent = data.unit;
              updateItemPrice(buyItem, itemPrice);
            })
            .catch(error => console.error('Error fetching item details:', error));
        }
      });
    });

    document.querySelectorAll('.quantity-input').forEach(quantityInput => {
      quantityInput.addEventListener('input', event => {
        const buyItem = event.target.closest('.buy-item');
        const itemSelect = buyItem.querySelector('.item-select');
        const itemId = itemSelect.value;
        const itemPriceInput = buyItem.querySelector('.item-price');
        const quantity = parseFloat(event.target.value) || 0;

        if (itemId) {
          fetch(`/items/${itemId}/details`)
            .then(response => response.json())
            .then(data => {
              const itemPrice = data.price;
              itemPriceInput.value = Math.round(itemPrice * quantity);
              updateTotalPrice(); // 合計価格を更新
            })
            .catch(error => console.error('Error fetching item details:', error));
        } else {
          itemPriceInput.value = '';
          updateTotalPrice(); // 合計価格を更新
        }
      });
    });
  }

  // フィールドセット追加
  function addNewFields() {
    const existingBuyItems = document.querySelectorAll('.buy-item');
    const newFields = existingBuyItems[0].cloneNode(true);
    const newIndex = existingBuyItems.length;

    newFields.querySelectorAll('input, select').forEach(input => {
      const name = input.getAttribute('name').replace(/\d+/, newIndex);
      const id = input.getAttribute('id').replace(/\d+/, newIndex);
      input.setAttribute('name', name);
      input.setAttribute('id', id);
      input.value = '';
    });

    document.getElementById('buy-item-forms').appendChild(newFields);
    initializeEvents();
  }

  // アイテムの価格を更新
  function updateItemPrice(buyItem, itemPrice) {
    const quantityInput = buyItem.querySelector('.quantity-input');
    const itemPriceInput = buyItem.querySelector('.item-price');
    const quantity = parseFloat(quantityInput.value) || 0;
    itemPriceInput.value = Math.round(itemPrice * quantity);
    updateTotalPrice(); // 合計価格を更新
  }
});