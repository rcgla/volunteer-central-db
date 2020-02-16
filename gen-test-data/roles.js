// master list of roles and role groups
const masterListOfRoles = [
    {
        group: 'CAMPERS',
        roles: [
            'FLAT',
            'SHARP',
            'GUITARIST',
            'BASSIST',
            'DRUMMER',
            'VOCALIST',
            'KEYBOARDIST',
            'MVP_CAMPER'
        ]
    },
    {
        group: 'VOLUNTEERS',
        roles: [
            'GUITAR_INSTRUCTOR',
            'DRUMS_INSTRUCTOR',
            'KEYS_INSTRUCTOR',
            'VOCALS_INSTRUCTOR',
            'BASS_INSTRUCTOR',
            'BAND_COACH',
            'COUNSELOR',
            'ROADIE',
            'GENERAL_SUPPORT',
            'SNACK_PATROL',
            'CHECK_IN',
            'CHECK_OUT',
            'AM_SUPERVISION',
            'PM_SUPERVISION',
            'VIT_COORDINATOR',
            'ASSEMBLY_SOUND',
            'CREW_COACH',
            'FRONT_DESK_LEAD',
            'MAYOR',
            'CO_DIRECTOR',
            'ART_DIRECTOR',
            'MVP_DIRECTOR',
            'CAMP_VIDEOGRAPHER',
            'KITCHEN_SUPPORT',
            'TEAM_FEELINGS',
            'MEDICAL',
            'SOCIAL_MEDIA_COORDINATOR',
            'FOOD_COORDINATOR',
            'GEAR_COORDINATOR',
            'GRATITUDE_COORDINATOR',
            'OUTREACH_COORDINATOR',
            'SPECIAL_EVENTS_COORDINATOR',
            'TECHNOLOGY_COORDINATOR',
            'VOLUNTEER_RESOURCES_COORDINATOR',
            'WORKSHOPS_COORDINATOR',
            'YOUTH_LEADERSHIP_COORDINATOR',
            'CAMP_STAGING_COORDINATOR',
            'CAMERA_MENTOR',
            'EDITING_MENTOR',
            'MVP_SUPPORT',
            'CAMP_PHOTOGRAPHER',
            'DAILY_RECAP_VIDEO'
        ]
    },
    {
        group: 'SUPPORT_CREW',
        roles: [
            'ROADIE',
            'GENERAL_SUPPORT',
            'SNACK_PATROL',
            'CHECK_IN',
            'CHECK_OUT',
            'AM_SUPERVISION',
            'PM_SUPERVISION',
            'FRONT_DESK_LEAD',
            'KITCHEN_SUPPORT'
        ]
    },
    {
        group: 'INSTRUCTORS',
        roles: [
            'GUITAR_INSTRUCTOR',
            'DRUMS_INSTRUCTOR',
            'KEYS_INSTRUCTOR',
            'VOCALS_INSTRUCTOR',
            'BASS_INSTRUCTOR',

        ]
    },
    {
        group: 'MVP_VOLUNTEERS',
        roles: [
            'CREW_COACH',
            'MVP_DIRECTOR',
            'CAMERA_MENTOR',
            'EDITING_MENTOR',
            'MVP_SUPPORT'
        ]
    },
    {
        // do we need this group?
        group: 'KITCHEN_CREW',
        roles: [
            'SNACK_PATROL',
            'KITCHEN_SUPPORT'
        ]
    },
    {
        group: 'YRPC',
        roles: [
            'SOCIAL_MEDIA_COORDINATOR',
            'FOOD_COORDINATOR',
            'GEAR_COORDINATOR',
            'GRATITUDE_COORDINATOR',
            'OUTREACH_COORDINATOR',
            'SPECIAL_EVENTS_COORDINATOR',
            'TECHNOLOGY_COORDINATOR',
            'VOLUNTEER_RESOURCES_COORDINATOR',
            'WORKSHOPS_COORDINATOR',
            'YOUTH_LEADERSHIP_COORDINATOR',
            'CAMP_STAGING_COORDINATOR',
        ]
    },
    {
        // do we need this group?
        group: 'DIRECTORS',
        roles: [
            'MAYOR',
            'CO_DIRECTOR',
            'ART_DIRECTOR',
            'MVP_DIRECTOR'
        ]
    }
];

module.exports = {
    masterListOfRoles
};