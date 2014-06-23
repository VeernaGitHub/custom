trigger CreateContact on Account (after insert) {
if(trigger.isAfter){
    if(trigger.isInsert){
    
    list<Contact> CraeteCon=new list<Contact>();
    for(Account acc:trigger.new){
    Contact con=new Contact();
    con.AccountId=acc.id;
    con.lastName=acc.name;
    con.firstName=acc.name;
    
    CraeteCon.add(con);
    }
    insert CraeteCon; 
  }
 }

}