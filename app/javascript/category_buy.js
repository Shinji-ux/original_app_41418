document.addEventListener('DOMContentLoaded', () => {
  initializeEvents();

  // フィールドセットを追加するボタンのイベント
  document.getElementById('add-form-set').addEventListener('click', function () {
    addNewFields();
  });

  function initializeEvents() {
    document.querySelectorAll('.buy-category-select').forEach(categorySelect => {
      categorySelect.addEventListener('change', function() {
        const categoryId = this.value;
        const buyItem = this.closest('.buy-item');
        const itemSelect = buyItem.querySelector('.buy-item-select');

        if (categoryId && itemSelect) {
          fetch(`/categories/${categoryId}/items`)
            .then(response => response.json())
            .then(data => {
              itemSelect.innerHTML = '';
              itemSelect.insertAdjacentHTML('beforeend', '<option value="">商品を選択</option>');

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

    document.querySelectorAll('.buy-item-select').forEach(itemSelect => {
      itemSelect.addEventListener('change', function() {
        const itemId = this.value;
        const buyItem = this.closest('.buy-item');
        const unitSpan = buyItem.querySelector('#unit');

        if (itemId) {
          fetch(`/items/${itemId}/details`)
            .then(response => response.json())
            .then(data => {
              unitSpan.textContent = data.unit;
            })
            .catch(error => console.error('Error fetching item details:', error));
        } else {
          unitSpan.textContent = '--';
        }
      });
    });
  }

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
});