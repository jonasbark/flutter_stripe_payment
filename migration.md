**flutter_stripe_payment** has been discontinued - a new plugin called [flutter_stripe](https://pub.dev/packages/flutter_stripe) should be used instead:

# Main changes
- the credit card information form is no longer a dialog but can be used as and styled as a native view
- support for [Payment Sheet](https://stripe.com/docs/payments/accept-a-payment?platform=android)
- support for many more [payment providers](https://github.com/flutter-stripe/flutter_stripe/blob/main/stripe_platform_interface/lib/src/models/payment_methods.dart#L36)
- [PCI compliant](https://stripe.com/en-de/guides/pci-compliance), SCA-Ready with [3D Secure authentication](https://stripe.com/docs/payments/3d-secure)
- integration with the [Pay](https://pub.dev/packages/pay) plugin
- documentation, support and regular updates

# Migration
| Old method name               | New method name        | Comment                                                   |
|-------------------------------|------------------------|-----------------------------------------------------------|
| `setOptions`                  | `initialize`           |                                                           |
| `setStripeAccount`            | `initialize`           | `stripeAccountId` parameter                               |
| `deviceSupportsNativePay`     | -                      | Apple + Google Pay is supported by using the `pay` plugin or payment sheet |
| `canMakeNativePayPayments`    | -                      | see above                                                 |
| `paymentRequestWithNativePay` | -                      | see above                                                 |
| `completeNativePayRequest`    | -                      | see above                                                 |
| `cancelNativePayRequest`      | -                      | see above                                                 |
| `paymentRequestWithCardForm`  | -                      | use the `CardField` view or payment sheet                 |
| `createTokenWithCard`         | `createPaymentMethod`  | use `PaymentMethodParams.card`                            |
| `createTokenWithBankAccount`  | `createPaymentMethod`  |                                                           |
| `createSourceWithParams`      | `createPaymentMethod`  |                                                           |
| `createPaymentMethod`         | `createPaymentMethod`  |                                                           |
| `authenticatePaymentIntent`   | `handleCardAction`     |                                                           |
| `confirmPaymentIntent`        | `confirmPaymentMethod` |                                                           |
| `authenticateSetupIntent`     | -                      |                                                           |
| `confirmSetupIntent`          | `confirmSetupIntent`   |                                                           |

Check the example app for details on how to use the new plugin.
