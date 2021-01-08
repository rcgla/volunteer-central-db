\c :dbname;
set schema 'rcglavc';

/*
this is useful for unit testing
remove all rows from data tables except for DbInfo
*/
drop function rcglavc.delete_all_data;
create or replace function rcglavc.delete_all_data()
returns void as $$
declare
    
begin
    -- triggers can be really slow and there's no reason to run them right now
    perform rcglavc.disable_triggers();

    -- delete from rcglavc."ActivitiesRoles";
    
    delete from rcglavc."UserAvailability";
    delete from rcglavc."ActivitiesRooms";
    delete from rcglavc."EventsLocations";
    delete from rcglavc."Placements";
    delete from rcglavc."Roles";
    delete from rcglavc."Photos";

    delete from rcglavc."UsersUserGroups";
    delete from rcglavc."UserGroups";

    delete from rcglavc."EmergencyContacts";
    delete from rcglavc."Users";
    delete from rcglavc."Logins";
    delete from rcglavc."UsersPrivateInfo";
    delete from rcglavc."UsersProtectedInfo";
    delete from rcglavc."TShirtSizes";
    
    delete from rcglavc."Activities";
    delete from rcglavc."Tracks";
    delete from rcglavc."Events";
    delete from rcglavc."EventTypes";

    delete from rcglavc."ActivityTypes";
    delete from rcglavc."TrackTypes";
    delete from rcglavc."Rooms";
    delete from rcglavc."Locations";

    
    -- re-enable the triggers
    perform rcglavc.enable_triggers();

end;
$$ language plpgsql volatile;
