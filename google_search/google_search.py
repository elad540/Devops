# to search
query = input("Enter your search: ")
try:
    from googlesearch import search
except ImportError:
    print("No module named 'google' found")

for j in search(query, tld="com", num=10, stop=5, pause=2):
    print(j)