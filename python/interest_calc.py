def valid_num(item):
    """This function validit if an item is float"""
    while True:
        if type(item) != "float":
            if item.isdigit():
                return float(item)
            else:
                item = input("this is a string and not a number, please enter a number? ")


initial_deposit = valid_num(input("what is your initial deposit? "))
interest_rate_in_percent = valid_num(input("what is the annual interest rate? "))
additional_contribution = valid_num(input("what is the additional contribution? "))
years = valid_num(input("how many years to deposit? "))
interest_rate = interest_rate_in_percent / 100
total_interest = (initial_deposit * interest_rate) * years
total_balance = initial_deposit + total_interest + additional_contribution
total_contribution = total_interest + additional_contribution
print(f"Total balance is {total_balance}")
print(f"Total interest is {total_interest}")
print(f"Total contribution is {total_contribution}")

