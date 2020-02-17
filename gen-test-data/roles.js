// master list of roles and role groups
const masterListOfRoleGroups = [
    {
        code: 'CAMPERS',
        name: 'Campers',
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
        code: 'VOLUNTEERS',
        name: 'Volunteers',
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
        code: 'SUPPORT_CREW',
        name: 'Support Crew',
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
        code: 'INSTRUCTORS',
        name: 'Instructors',
        roles: [
            'GUITAR_INSTRUCTOR',
            'DRUMS_INSTRUCTOR',
            'KEYS_INSTRUCTOR',
            'VOCALS_INSTRUCTOR',
            'BASS_INSTRUCTOR',

        ]
    },
    {
        code: 'MVP_VOLUNTEERS',
        name: 'MVP Volunteers',
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
        code: 'KITCHEN_CREW',
        name: 'Kitchen Crew',
        roles: [
            'SNACK_PATROL',
            'KITCHEN_SUPPORT'
        ]
    },
    {
        code: 'YRPC',
        name: 'Year-Round Planning Committee',
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
        code: 'DIRECTORS',
        name: 'Directors',
        roles: [
            'MAYOR',
            'CO_DIRECTOR',
            'ART_DIRECTOR',
            'MVP_DIRECTOR'
        ]
    }
];

const masterListOfRoles = [
    {code: 'FLAT', name: "Flat"},
    {code: 'SHARP', name: "Sharp"},
    {code: 'GUITARIST', name: "Guitarist"},
    {code: 'BASSIST', name: "Bassist"},
    {code: 'DRUMMER', name: "Drummer"},
    {code: 'VOCALIST', name: "Vocalist"},
    {code: 'KEYBOARDIST', name: "Keyboardist"},
    {code: 'MVP_CAMPER', name: "MVP Camper"},
    {code: 'GUITAR_INSTRUCTOR', name: "Guitar Instructor"},
    {code: 'DRUMS_INSTRUCTOR', name: "Drums Instructor"},
    {code: 'KEYS_INSTRUCTOR', name: "Keys Instructor"},
    {code: 'VOCALS_INSTRUCTOR', name: "Vocals Instructor"},
    {code: 'BASS_INSTRUCTOR', name: "Bass Instructor"},
    {code: 'BAND_COACH', name: "Band Coach"},
    {code: 'COUNSELOR', name: "Counselor"},
    {code: 'ROADIE', name: "Roadie"},
    {code: 'GENERAL_SUPPORT', name: "General Support"},
    {code: 'SNACK_PATROL', name: "Snack Patrol"},
    {code: 'CHECK_IN', name: "Check-in"},
    {code: 'CHECK_OUT', name: "Check-out"},
    {code: 'AM_SUPERVISION', name: "A.M. Supervision"},
    {code: 'PM_SUPERVISION', name: "P.M. Supervision"},
    {code: 'VIT_COORDINATOR', name: "VIT Coordinator"},
    {code: 'ASSEMBLY_SOUND', name: "Assembly Sound"},
    {code: 'CREW_COACH', name: "Crew Coach"},
    {code: 'FRONT_DESK_LEAD', name: "Front Desk Lead"},
    {code: 'MAYOR', name: "Mayor of Awesometown"},
    {code: 'CO_DIRECTOR', name: "Co-Director"},
    {code: 'ART_DIRECTOR', name: "Art Director"},
    {code: 'MVP_DIRECTOR', name: "MVP Director"},
    {code: 'CAMP_VIDEOGRAPHER', name: "Camp Videographer"},
    {code: 'KITCHEN_SUPPORT', name: "Kitchen Support"},
    {code: 'TEAM_FEELINGS', name: "Team Feelings"},
    {code: 'MEDICAL', name: "Medical"},
    {code: 'SOCIAL_MEDIA_COORDINATOR', name: "Social Media Coordinator"},
    {code: 'FOOD_COORDINATOR', name: "Food Coordinator"},
    {code: 'GEAR_COORDINATOR', name: "Gear Coordinator"},
    {code: 'GRATITUDE_COORDINATOR', name: "Gratitude Coordinator"},
    {code: 'OUTREACH_COORDINATOR', name: "Outreach Coordinator"},
    {code: 'SPECIAL_EVENTS_COORDINATOR', name: "Special Events Coordinator"},
    {code: 'TECHNOLOGY_COORDINATOR', name: "Technology Coordinator"},
    {code: 'VOLUNTEER_RESOURCES_COORDINATOR', name: "Volunteer Resources Coordinator"},
    {code: 'WORKSHOPS_COORDINATOR', name: "Workshops Coordinator"},
    {code: 'YOUTH_LEADERSHIP_COORDINATOR', name: "Youth Leadership Coordinator"},
    {code: 'CAMP_STAGING_COORDINATOR', name: "Camp Staging Coordinator"},
    {code: 'CAMERA_MENTOR', name: "Camera Mentor"},
    {code: 'EDITING_MENTOR', name: "Editing Mentor"},
    {code: 'MVP_SUPPORT', name: "MVP Support"},
    {code: 'CAMP_PHOTOGRAPHER', name: "Camp Photographer"},
    {code: 'DAILY_RECAP_VIDEO', name: "Daily Recap Video"},
]

module.exports = {
    masterListOfRoleGroups,
    masterListOfRoles
};