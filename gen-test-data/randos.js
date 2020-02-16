// TODO add additional realistic examples
let volRoleExamples = [
    [
        'GUITAR_INSTRUCTOR',
        'BAND_COACH',
        'FOOD_COORDINATOR'
    ],
    [
        'COUNSELOR',
        'AM_SUPERVISION'
    ],
    [
        'GENERAL_SUPPORT',
        'BAND_COACH'
    ],
    [
        'KITCHEN_SUPPORT',
        'ROADIE'
    ],
    [
        'CREW_COACH'
    ],
    [
        'EDITING_MENTOR'
    ]
];

// TODO add additional realistic examples
let camperRoleExamples = [
    [
        'FLAT',
        'DRUMMER'
    ],
    [
        'SHARP',
        'GUITARIST'
    ],
    [
        'MVP_CAMPER'
    ],
    [
        'FLAT',
        'BASSIST'
    ],
    [
        'SHARP',
        'VOCALIST'
    ]
]

// randomizers

let randTShirtSize = () => rand(['XS', 'S', 'M', 'L', 'XL']);
let randMealPref = () => rand(['OMNIVORE', 'VEGETARIAN', 'VEGAN']);
let randAllergies = () => rand(['Dairy', 'Gluten', 'Strawberries and mango', '', 'None', 'Nope!']);
let randPhotoUrl = () => `/images/fakeProfiles/${rand(['cathead', 'tigerface', 'tigercave', 'sidbed', 'sidpark', 'pinto', 'babyb'])}.png`;
let randRoles = isVol => isVol ? rand(volRoleExamples) : rand(camperRoleExamples);

function rand(arr) {
    return arr[Math.floor(Math.random() * Math.floor(arr.length))];
}

module.exports = {
    randTShirtSize,
    randMealPref,
    randAllergies,
    randPhotoUrl,
    randRoles
}