document.addEventListener("DOMContentLoaded", function() {
  const calculateTotalPrice = () => {
    let totalPrice = 0;

    // 合計を計算
    document.querySelectorAll(".item-price-edit").forEach(function(itemPriceElement) {
      let itemPrice = parseFloat(itemPriceElement.value) || 0;
      totalPrice += itemPrice;
    });

    // 合計金額をtotal_price_editフィールドに設定
    document.getElementById("total_price_edit").value = totalPrice;
  };

  // 全ての金額フィールドにイベントリスナーを追加
  document.querySelectorAll(".item-price-edit").forEach(function(element) {
    element.addEventListener("input", calculateTotalPrice);
  });

  // 初期ロード時に合計を計算
  calculateTotalPrice();
});