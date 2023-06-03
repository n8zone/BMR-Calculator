CALCULATION = "CALCULATION"
GENDER = "GENDER"

local options = {[CALCULATION] = {"Maintenance Calories", "Daily Protein Needs", "Bulking Calories","Cutting Calories"}, [GENDER] = {"male", "female"}}
local userInfo = {["gender"] = nil, ["weight"] = nil, ["height"] = nil, ["age"] = nil}
-- male (88.4 + 13.4 * weight) + (4.8 * height) - (5.68 * age)
-- male (447.6 + 9.25 * weight) + (3.10 * height) - (4.33 * age)

function requestInputFromSet (set)
    local curOptions = options[set]
    print("set")
    for k, v in ipairs(curOptions) do
        print(k .. ") " .. v)
    end
    local choice = io.read("*n")
    io.flush()

    print("You chose " .. curOptions[choice])
    return curOptions[choice]
end

function requestNumericInput (prompt)
    print(prompt)
    local n = io.read("*n")
    io.flush()
    return n
end

function calculateCalories()
    print("Excellent, let's get started with your sex.")
    userInfo["gender"] = requestInputFromSet(GENDER)

    userInfo["age"] = requestNumericInput("How old are you?")
    
    userInfo["height"] = requestNumericInput("How tall are you? (cm)")
    
    userInfo["weight"] = requestNumericInput("How much do you weigh? (kg)")
    
    local calories = userInfo["gender"] == "male" and ((88.4 + (13.4 * userInfo["weight"])) + (4.8 * userInfo["height"]) - (5.68 * userInfo["age"])) or ((447.6 + (9.25 * userInfo["weight"])) + (3.1 * userInfo["height"]) - (4.33 * userInfo["age"]))  
    print("Your maintenance calories are " .. calories)

end

print("Hello! Welcome to Nate's Fitness Calculator. What would you like to calculate?")

local nextStep = requestInputFromSet(CALCULATION)
local currentStepOptions = options[CALCULATION]





if(nextStep == currentStepOptions[1]) then
    calculateCalories()
elseif(nextStep == currentStepOptions[2]) then
    print("Calculating Daily Protein Needs")
elseif(nextStep == currentStepOptions[3]) then
    print("Calculating Bulking Calories")
elseif(nextStep == currentStepOptions[4]) then
    print("Calculating Cutting Calories")
end