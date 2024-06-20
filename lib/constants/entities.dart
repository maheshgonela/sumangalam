abstract class Entities {
  static const user = 'ADUser';
  static const device = 'EPN_Device';
  static const organization = 'Organization';
  static const businessPartner = 'BusinessPartner';
  static const approvalUser = 'SAM_Approvalorder';
  static const bankAccount = 'BusinessPartnerBankAccount';
  static const businessPartnerLocation = 'BusinessPartnerLocation';
  static const preference = "ADPreference";
  static const expense = 'eem_expenserequest';
  static const image = 'ADImage';
  static const roleOrganization = 'ADRoleOrganization';
  static const financialGLItem = 'eem_budgetline';
  static const invoice = 'Invoice';
  static const attachment = 'ADAttachment';
  static const payments = 'FIN_PaymentMethod';
  static const payingFrom = 'FIN_Financial_Account';
  static const costCenter = 'Costcenter';
}

abstract class OBPreferences {
  static const mobileVersion = 'App Version';
}
////eem_budgetline