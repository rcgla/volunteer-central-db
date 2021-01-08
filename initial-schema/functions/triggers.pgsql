\c :dbname;
set schema 'rcglavc';

-- non-owner roles cannot disable triggers
-- but we can provide a function to do so
-- and give the role access to that function

-- disable triggers
create or replace function disable_triggers() 
returns void
language SQL 
as $$
    -- these are examples from a different project
    -- alter table rcglavc."AnswerSets" disable trigger answer_set_is_latest_trigger;
    -- alter table rcglavc."AnswerSets" disable trigger testing_environment_is_public_trigger;
$$ security definer;

-- enable triggers
create or replace function enable_triggers() 
returns void
language SQL 
as $$
    -- these are examples from a different project
    -- alter table rcglavc."AnswerSets" enable trigger answer_set_is_latest_trigger;
    -- alter table rcglavc."AnswerSets" enable trigger testing_environment_is_public_trigger;
$$ security definer;
