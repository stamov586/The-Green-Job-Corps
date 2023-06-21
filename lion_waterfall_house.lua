--[[GreenJobCorps.lua 

--This program creates a Green Job Corps that would help generate and manage jobs for members 

--Define the data structures that will store the Corps's information
local Members = {}
local Companies = {}

--Create functions to add and remove members to the Corps
function addMember(name, age)
  Members[name] = age
end

function removeMember(name)
  Members[name] = nil
end

--Create functions to add and remove companies
function addCompany(name, description)
  Companies[name] = description
end

function removeCompany(name)
  Companies[name] = nil
end

--Create functions to assign jobs to members 
function assignJob(memberName, companyName)
  Members[memberName].company = companyName
  Companies[companyName] = nil
end

--Create functions to manage the job postings
function postJob(companyName, jobDescription)
  Companies[companyName].jobs[#Companies[companyName].jobs + 1] = jobDescription
end

function deleteJob(companyName, jobDescription)
  for i,v in ipairs(Companies[companyName].jobs) do
    if v == jobDescription then
      table.remove(Companies[companyName].jobs, i)
    end
  end
end

--Create a function to calculate the Corps's total monthly income
function monthlyIncome()
  local income = 0 
  for k,v in pairs(Members) do
    income = income + v.monthlyIncome
  end
  return income
end

--Create a function to calculate the average monthly income of all members
function avgMonthlyIncome()
  local totalIncome = 0
  for k,v in pairs(Members) do
    totalIncome = totalIncome + v.monthlyIncome 
  end
  return totalIncome/table.getn(Members)
end

--Create functions to add and remove members from companies 
function addToCompany(memberName, companyName)
  for k,v in pairs(Members[memberName]) do
    table.insert(Companies[companyName].members, k)
  end
end

function removeFromCompany(memberName, companyName)
  for i,v in ipairs(Companies[companyName].members) do
    if v == memberName then
      table.remove(Companies[companyName].members, i)
    end
  end
end

--Define a main function to run when the script is executed
function main()
  while true do
    print("Welcome to Green Job Corps!")
    print("1. Add/Remove Members")
    print("2. Add/Remove Companies")
    print("3. Assign Jobs")
    print("4. Post/Delete Job Openings")
    print("5. Calculate Monthly Income")
    print("6. Calculate Average Monthly Income")
    print("7. Add/Remove Members from Companies")
    print("8. Quit")
    print("Please enter your option:")

    local option = io.read()
    if option == "1" then
      print("Do you want to add(a) or remove(r) a member?")
      local action = io.read()
      if action == "a" then
        print("Please enter the member's name:")
        local name = io.read()
        print("Please enter the member's age:")
        local age = io.read()
        addMember(name, age)
      elseif action == "r" then
        print("Please enter the member's name:")
        local name = io.read()
        removeMember(name)
      end
    elseif option == "2" then
      print("Do you want to add(a) or remove(r) a company?")
      local action = io.read()
      if action == "a" then
        print("Please enter the company name:")
        local name = io.read()
        print("Please enter the company description:")
        local description = io.read()
        addCompany(name, description)
      elseif action == "r" then
        print("Please enter the company name:")
        local name = io.read()
        removeCompany(name)
      end
    elseif option == "3" then
      print("Please enter the member's name:")
      local memberName = io.read()
      print("Please enter the company name:")
      local companyName = io.read()
      assignJob(memberName, companyName)
    elseif option == "4" then
      print("Do you want to post(p) or delete(d) a job opening?")
      local action = io.read()
      if action == "p" then
        print("Please enter the company name:")
        local companyName = io.read()
        print("Please enter the job description:")
        local jobDescription = io.read()
        postJob(companyName, jobDescription)
      elseif action == "d" then
        print("Please enter the company name:")
        local companyName = io.read()
        print("Please enter the job description:")
        local jobDescription = io.read()
        deleteJob(companyName, jobDescription)
      end
    elseif option == "5" then
      print("The total monthly income of the Corps is $"..monthlyIncome())
    elseif option == "6" then
      print("The average monthly income of all members is $"..avgMonthlyIncome())
    elseif option == "7" then
      print("Do you want to add(a) or remove(r) a member from a company?")
      local action = io.read()
      if action == "a" then
        print("Please enter the member's name:")
        local memberName = io.read()
        print("Please enter the company name:")
        local companyName = io.read()
        addToCompany(memberName, companyName)
      elseif action == "r" then
        print("Please enter the member's name:")
        local memberName = io.read()
        print("Please enter the company name:")
        local companyName = io.read()
        removeFromCompany(memberName, companyName)
      end
    elseif option == "8" then
      break
    end
  end
end

main()

--]]