abstract class Messages {
  static const invalidUser = 'No user found with the entered credentials.';
  // Create Expense
  static const expenseCreateMsg =
      'A new expense "{docNo}" has been created and saved successfully.\nAre you sure you want to send it for approval?';
  static const sendForApprovalMsg =
      'Expense "{docNo}" is sent for Approval Successfully';
  // Expense Details
  static const approveExpMsg = 'Expense Approved Successfully..!';
  static const rejectExpMsg = 'Expense Rejected Successfully..!';
  // Payment Details
  static const paymentSuccess = 'Payment details have been successfully sent.';
  //Payment Dilouge Messages
  static const paymentRequest = 'Payment Request is Approved';
  //Expense screen empty list msg
  static const tryAgain =
      'There is no Expenses found with applied fliters.\nTry again by updating filters';
  static const products =
      'Please select an organization to view the related products.';
}
