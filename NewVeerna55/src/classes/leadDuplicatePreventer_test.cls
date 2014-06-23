@isTest
  public class leadDuplicatePreventer_test{
  static testMethod void LeadInsertOne(){
  set<string> testEmail=new set<string>();
  testEmail.add('veerna@yahoo.in');
  testEmail.add('veerna1@yahoo.in');
  testEmail.add('veerna2@yahoo.in');
  testEmail.add('veerna3@yahoo.in');
  testEmail.add('veerna4@yahoo.in');
  System.assert([select count() from lead where email in:testEmail]==0);
  
  Lead lead1=new Lead(Lastname='xxxx',company='tcs',Email='veerna@yahoo.in',status='Open-notContacted');
  Lead lead2=new Lead(Lastname='xxxx',company='tcs',Email='veerna1@yahoo.in',status='Open-notContacted');
  Lead lead3=new Lead(Lastname='xxxx',company='tcs',Email='veerna5@yahoo.in',status='Open-notContacted');
  Lead lead4=new Lead(Lastname='xxxx',company='tcs',Email='veerna3@yahoo.in',status='Open-notContacted');
  Lead[] lead =new Lead[]{lead1,lead2,lead3,lead4};
  insert lead;
  
  lead2.Email='veerna2@yahoo.in';
  lead4.email='veerna4@yahoo.in';
  update lead;
  Lead dup1 = new Lead(LastName='Test1Dup',
                           Company='Test1Dup Inc.',
                           Email='veerna@yahoo.in');
      try {
         insert dup1;
          System.assert(false);
      } catch (DmlException e) {
         System.assert(e.getNumDml() == 1);
         System.assert(e.getDmlIndex(0) == 0);
         System.assert(e.getDmlFields(0).size() == 1);
         //System.assert(e.getDmlFields(0)[2] == Email);
         System.assert(e.getDmlMessage(0).indexOf(
            'A lead with this email address already exists.') > -1);
      }
      
       Lead dup = new Lead(LastName='Test2Dup',Company='Test2Dup Inc.',Email='veerna5@yahoo.in');
        Lead dup2 = new Lead(LastName='Test3Dup',Company='Test2Dup Inc.',Email='veerna6@yahoo.in');
         Lead dup3 = new Lead(LastName='Test4Dup',Company='Test1Dup Inc.',Email='veerna7@yahoo.in');
          Lead dup4 = new Lead(LastName='Test5Dup',Company='Test1Dup Inc.',Email='veerna8@yahoo.in');
          Lead[] dups=new Lead[]{dup,dup2,dup3,dup4};
       try{
        insert dups;
        System.assert(false);
        }catch(DmlException e){
          system.assert(e.getNumDml()== 1);
    }
  }
 }