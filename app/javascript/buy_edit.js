document.addEventListener("DOMContentLoaded", function() {
  // 合計価格の計算
  const calculateTotalPrice = () => {
    let totalPrice = 0;

    // 各商品合計価格を合計
    document.querySelectorAll(".item-total-price-edit").forEach(function(itemTotalPriceElement) {
      let itemTotalPrice = parseFloat(itemTotalPriceElement.value) || 0;
      totalPrice += itemTotalPrice;
    });

    // 合計金額をtotal_price_editフィールドに設定
    document.getElementById("total_price_edit").value = totalPrice;
  };

  // 商品単価と数量から商品合計価格を計算
  const updateItemTotalPrice = (element) => {
    const sellItemRow = element.closest('tr');
    const quantityElement = sellItemRow.querySelector('.quantity-edit');
    const itemPriceElement = sellItemRow.querySelector('.item-price-edit');
    const itemTotalPriceElement = sellItemRow.querySelector('.item-total-price-edit');

    const quantity = parseFloat(quantityElement.value) || 0;
    const itemPrice = parseFloat(itemPriceElement.value) || 0;

    const itemTotalPrice = quantity * itemPrice;
    itemTotalPriceElement.value = itemTotalPrice;

    // 更新後、合計価格を再計算
    calculateTotalPrice();
  };

  // 全てのquantityフィールドにイベントリスナーを追加
  document.querySelectorAll(".quantity-edit").forEach(function(element) {
    element.addEventListener("input", function() {
      updateItemTotalPrice(element);
    });
  });

  // 全てのitem-priceフィールドにイベントリスナーを追加
  document.querySelectorAll(".item-price-edit").forEach(function(element) {
    element.addEventListener("input", function() {
      updateItemTotalPrice(element);
    });
  });

  // 初期ロード時に合計を計算
  calculateTotalPrice();
});