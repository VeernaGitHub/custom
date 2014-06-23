@IsTest
  public class CreateContact_test{
  public static testMethod void CreateAccount(){ 
  Account acc1=new Account(name='xxxx');
  insert acc1;
  list<Contact> CreateContact=new list<Contact>();
  for(Integer x=0;x<205;x++){
  Contact ct=new Contact(AccountId=acc.id,lastname='chow');
  CreateContact.add(ct);
  }
  test.startTest();
  insert CreateContact;
  test.stopTest();
  }
  }