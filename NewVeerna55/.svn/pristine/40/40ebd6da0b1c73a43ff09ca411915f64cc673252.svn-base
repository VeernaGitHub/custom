trigger DuplicateEmailAdd on Contact (before insert,before update) {
 
 map<String,Contact> newMap=new map<String,Contact>();
 for(Contact con:System.trigger.new){
  if((System.trigger.isInsert ||(con.Email!=System.trigger.oldMap.get(con.id).Email))){
    if(newMap.containsKey(con.Email)){
    con.Email.addError('*****abc*******');
    }
  }else{
  newMap.put(con.Email,con);
  }
 }
 for(Contact con:[select Email from Contact where Email IN:newMap.keyset()]){
 Contact NewContact=newMap.get(con.Email);
 NewContact.Email.addError('***********');
 }

}