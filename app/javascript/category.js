// document.addEventListener("turbo:load", function() {
//   console.log("turbo:load event triggered");

//   // ロードされたときのフォームセットにイベントリスナーをセット
//   document.querySelectorAll('.form-set').forEach((formSet, index) => {
//     console.log(`Setting category change listener for index: ${index}`);
//     setCategoryChangeListener(index);
//   });

//   const addButton = document.getElementById('add-form-set');
//   if (addButton) {
//     addButton.addEventListener('click', function() {
//       const formSetsContainer = document.getElementById('form-sets-container');
//       const newIndex = formSetsContainer.querySelectorAll('.form-set').length;

//       console.log(`Adding new form set with index: ${newIndex}`);

//       const newFormSet = `
//         <div class="form-set">
//           <div>
//             <label>カテゴリ</label>
//             <select class="category-select" name="buy[buy_items_attributes][${newIndex}][category_id]" id="category-select-${newIndex}">
//               <option value="">カテゴリを選択</option>
//               ${document.querySelector('select.category-select').innerHTML}
//             </select>
//           </div>

//           <div>
//             <label>商品</label>
//             <select class="item-select" name="buy[buy_items_attributes][${newIndex}][item_id]" id="item-select-${newIndex}">
//               <option>商品を選択</option>
//             </select>
//             <div id="item-error-${newIndex}"></div>
//           </div>

//           <div>
//             <label>数量</label>
//             <input type="number" name="buy[buy_items_attributes][${newIndex}][quantity]" id="buy_items_${newIndex}_quantity" />
//           </div>
//         </div>
//       `;

//       formSetsContainer.insertAdjacentHTML('beforeend', newFormSet);
//       setCategoryChangeListener(newIndex);
//     });
//   } else {
//     console.error("'add-form-set' button not found");
//   }
// });

// function setCategoryChangeListener(formSetIndex) {
//   document.addEventListener("turbo:load", function() {
//     const categorySelect = document.querySelector(`#category-select-${formSetIndex}`);
//     if (!categorySelect) {
//       console.error(`Category select element not found for index: ${formSetIndex}`);
//       return;
//     }

//     const itemSelect = document.getElementById(`item-select-${formSetIndex}`);
//     const itemErrorDiv = document.getElementById(`item-error-${formSetIndex}`);

//     console.log(`Setting change listener for categorySelect with id: category-select-${formSetIndex}`);

//     categorySelect.addEventListener("change", function() {
//       const categoryId = categorySelect.value;
//       if (categoryId) {
//         console.log(`Fetching items for category id: ${categoryId}`);
//         fetch(`/items/filter_by_category?category_id=${categoryId}`, { headers: { 'X-Requested-With': 'XMLHttpRequest' } })
//           .then(response => {
//             console.log(`Received response with status: ${response.status}`);
//             return response.text();
//           })
//           .then(html => {
//             console.log(`Received HTML: ${html}`);
//             itemSelect.innerHTML = html;
//           })
//           .catch(error => {
//             console.error(`Error fetching items: ${error}`);
//             itemErrorDiv.textContent = "商品の取得に失敗しました。";
//           });
//       } else {
//         itemSelect.innerHTML = '<option>商品を選択</option>';
//       }
//     });
//   });
// }

// // 関数をエクスポート
// export { setCategoryChangeListener };