document.addEventListener('DOMContentLoaded', () => {
  const categorySelect = document.querySelector('.category-select');

  if (categorySelect) {
    categorySelect.addEventListener('change', function() {
      const categoryId = this.value;
      const itemSelect = document.querySelector('.item-select');

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
          });
      }
    });
  }
});