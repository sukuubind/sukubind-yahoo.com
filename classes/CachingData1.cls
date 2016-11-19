public class CachingData1 {

    // Define variables 
    public Static Boolean userIsSpecial = false;
    public Static Boolean isUserInfoCached = false;
    public Static String userTimeZone = null;
    
    public Static Boolean isUserSpecial()
    {
       if( isUserInfoCached)
       return userIsSpecial;
       // Comment added to check the revision.
       cacheUserInfo();
       return userIsSpecial;
    }
    
    public Static String userTimeZone()
    {
        if(isUserInfoCached)
        return userTimeZone;
        
        cacheUserInfo();
        return userTimeZone();
    }
    
    public Static void cacheUserInfo()
    {
        if(isUserInfoCached)
        return;
        
        User u = [Select Id,UserIsSpecial__c,TimeZoneSidKey from User Where Id =: userInfo.getUserId()];
        userIsSpecial = u.UserIsSpecial__c;
        userTimeZone = u.TimeZoneSidKey;
        isUserInfoCached = true;
    }
}