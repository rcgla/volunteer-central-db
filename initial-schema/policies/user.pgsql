\c :dbname;

drop role if exists rcglavc_user_role;
create role rcglavc_user_role;

/* User can see camper groups of which they are a member */
grant select on rcglavc."CamperGroups" to rcglavc_user_role;
create policy rcglavc_user_CamperGroups
    on rcglavc."CamperGroups" 
    to rcglavc_user_role
    using(
        exists (
            select rcglavc."CamperGroups"."id" 
            from rcglavc."CamperGroups", rcglavc."UsersInCamperGroups"
            where rcglavc."CamperGroups"."id" = rcglavc."UsersInCamperGroups"."camper_group_id"
            and 
            rcglavc."UsersInCamperGroups"."user_id" = rcglavc.current_user_id()
        )
    );

/* User can change their own password */
grant update("password") on rcglavc."Logins" to rcglavc_user_role;
create policy rcglavc_user_Logins
    on rcglavc."Logins"
    to rcglavc_user_role
    using (
        exists(
            select "login_id", "id" 
            from rcglavc."Users"
            where rcglavc."Users"."id" = rcglavc.current_user_id()
            and
            rcglavc."Users"."login_id" = rcglavc."Logins"."id"
        )
    );

/* User can see and edit own participation */
create policy rcglavc_user_Participation
    on rcglavc."Participation" 
    to rcglavc_user_role
    using(rcglavc."Participation"."user_id" = rcglavc.current_user_id());

/* User can see schedule for user-visible events of sessions they are participating in */
/* TODO refine this policy
    Schedule.visibility = USER or ALL
    and
    (
        Schedule.session = Participation.session_id where Participation.user_id = current_user_id()
        or
        Schedule.session = not specified
    )

*/
create policy rcglavc_user_Schedule
    on rcglavc."Schedule" 
    to rcglavc_user_role
    using (rcglavc."Schedule"."visibility" = 'USER');

/* User can see all sessions */
create policy rcglavc_user_Sessions
    on rcglavc."Sessions" 
    to rcglavc_user_role
    using(true);

/* user can see and edit own details */
create policy rcglavc_user_Users
    on rcglavc."Users"
    to rcglavc_user_role
    using (rcglavc."Users"."id" = rcglavc.current_user_id());


/* User can see and edit own availability */
create policy rcglavc_user_UserAvailability
    on rcglavc."UserAvailability" 
    to rcglavc_user_role
    using (rcglavc."UserAvailability"."user_id" = rcglavc.current_user_id());

/* Users can see what they are a part of */
create policy rcglavc_user_UsersInCamperGroups
    on rcglavc."UsersInCamperGroups" 
    to rcglavc_user_role
    using (rcglavc."UsersInCamperGroups"."user_id" = rcglavc.current_user_id());


grant rcglavc_public_role to rcglavc_user_role;
grant rcglavc_user_role to rcglavc_app_role;
