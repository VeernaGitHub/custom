trigger DuplicateEmail on Account (before insert,before update){

 map<String,Account> NewMap=new map<String,Account>();
 for(Account acc: system.trigger.new){
  if((acc.Phone!=null) && (system.trigger.isInsert||(acc.Phone!=system.trigger.oldMap.get(acc.id).Phone))){
    if(newMap.containsKey(acc.phone)){
     acc.phone.addError('the phone number is also exists');
    }
    
  }else{
     NewMap.put(acc.Phone,acc);
   }
 }
 for(Account accs:[select phone from Account where phone IN:NewMap.KeySet()]){
 
 Account NewAccount=NewMap.get(accs.phone);
 NewAccount.Phone.addError('A Account with this Phone'
                               +'address already exists.');
 }
 
 
}