# 缴费二维码

## 方式一：支付详情页动态二维码（推荐）

每笔待缴费订单打开 **`patient-payment-detail.html?userId=…&userName=…&feeId=…`**，页面会根据当前订单 **自动生成** 专属二维码（扫码链接含该 `feeId`）。

列表页 **`patient-payment.html` 保持不变**，仅增加「查看支付详情（动态二维码）」入口。

## 方式二：Amazing-QR 静态图（列表页仍可用）

列表页仍展示 `images/qr-payment.png`（可选）。若要用 Amazing-QR 为**某一单**生成艺术二维码，链接应指向详情页：

```bash
cd doctor/src/main/webapp/amazing-qr-master
pip install pillow imageio
python amzqr.py "http://localhost:8081/doctor/patient-payment-detail.html?userId=14&userName=张钊&feeId=123&scanPay=1" -n qr-payment.png -d ../images
```

## 扫码逻辑

- 扫码打开带 **`scanPay=1`** 的详情页 → `POST /doctor/feeInfo/scanPay` → `fee_info.pay_status` **0→1**
- 详情页「确认已支付」：查库为 **1** 则隐藏二维码并显示成功；为 **0** 则继续显示二维码
