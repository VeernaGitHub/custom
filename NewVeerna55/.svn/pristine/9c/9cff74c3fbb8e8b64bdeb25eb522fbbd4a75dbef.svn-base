@isTest
 public class AccountUpdateContactUpdate_Test{
  static testMethod void AccountUpdateContactUpdateOne(){
  Account acc=new Account(name='TAke any name',BillingCity='hyderabd');
  insert acc;
  Contact con=new contact(AccountId=acc.id,Firstname='admin',LastName='Sfdc',MailingCity='ban');
  insert con;
  acc.BillingCity='bangalore';
  update acc;
  update con;
  }
 }