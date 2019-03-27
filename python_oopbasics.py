# Class #
class Employee:

    # Class members #
    raise_amount = 1.04     # 4%

    def __init__(self, firstname, lastname, salary):
        self.firstname = firstname
        self.lastname = lastname
        self.salary = salary
        self.email = '{}.{}@company.com'.format(self.firstname, self.lastname)
    # ----------------------------------------------------------- #
    # Object method: Method that uses object members (using self) #
    # ----------------------------------------------------------- #
    def fullname(self):
        return '{} {}'.format(self.firstname, self.lastname)

    # ----------------------------------------------------------- #
    # Property: Instead of object method we could use property to get value.
    # ----------------------------------------------------------- #
    @property
    def fullname(self):
        return '{} {}'.format(self.firstname, self.lastname)

    # Property value setter
    @fullname.setter
    def fullname(self, name):
        first, last = name.split(' ')
        self.firstname = first
        self.lastname = last

    # ----------------------------------------------------------- #
    # Class method (not static method): Method that don't use object members (using self) #
    # ----------------------------------------------------------- #
    @classmethod
    def set_raise_amount(cls, amount):
        cls.raise_amount = amount

    # Class method that returns object of this class #
    @classmethod
    def from_string(cls, emp_str):
        first, last, pay = emp_str.split('-')
        return cls(first, last, pay)


    # ----------------------------------------------------------- #
    # Static method: method that are related to the class but don't use class member or object member #
    # ----------------------------------------------------------- #
    @staticmethod
    def is_workday(day):
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return True


# Object #
emp_1 = Employee('Corey', 'Schafer', 50000)
emp_2 = Employee('Test', 'Employee', 60000)

print(emp_1.email)
# print(emp_1.fullname()) # using object method
print(emp_1.fullname)    # using property
emp_1.fullname = 'foo bar'
print(emp_1.fullname)    # using property

# Class method usage #
Employee.set_raise_amount(1.05)

print(Employee.raise_amount)
print(emp_1.raise_amount)
print(emp_2.raise_amount)

print(Employee.__dict__)
print(emp_1.__dict__)

del emp_1.fullname      # to be able to delete any property we must have @<property_name>.deleter

# --------------------------------------------------------------- #

# Inheritance #
class Developer(Employee):
    raise_amt = 1.10

    def __init__(self, first, last, pay, prog_language):
        super().__init__(first, last, pay)
        self.prog_language = prog_language

# Inheritance #
class Manager(Employee):
    def __init__(self, first, last, pay, employees=None):
        super().__init__(first, last, pay)
        if employees is None:
            self.employees = []
        else:
            self.employees = employees

dev_1 = Developer('Corey', 'Schafer', 50000, 'Python')
mgr_1 = Manager('Sue', 'Smith', 90000, [dev_1])

print(Developer.__dict__)
print(dev_1.__dict__)

# --------------------------------------------------------------- #
