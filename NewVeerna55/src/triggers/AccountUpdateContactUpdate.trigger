trigger AccountUpdateContactUpdate on Account (after update) {
if(trigger.isUpdate){
 set<id> ids=new set<id>();
  for(Account acc:trigger.new){
     Account oAccount=trigger.oldMap.get(acc.id);
     boolean isChanged=(acc.BillingCity!=oAccount.BillingCity);
     if(isChanged){
      ids.add(acc.id);
     }
    }
    if(ids.isEmpty()==false){
    list<Contact> listContacts =[select id,AccountId,mailingCity from Contact where id in:ids ];
    for(Contact oContact : listContacts ){
     Account oAccount=trigger.newMap.get(oContact.AccountId);
     oContact .mailingCity =oAccount.BillingCity;
    
    }
    update listContacts ;
 }
  
 }
}