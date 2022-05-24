![](https://img.shields.io/badge/Microverse-blueviolet)

# BUDGETS!

> Web application that allows you to record money transactions and separate them in categories!


## Built With

- Ruby
- Ruby on Rails
- Bootstrap, RSpec, PostgreSQL

## Live Demo (not available)

Check this [live demo]() of the page!

## Getting Started


To get a local copy up and running follow these simple example steps.

### Prerequisites

To use this project you first need to have installed the following:

+ Node.js
+ Ruby
+ PostgreSQL
+ Rails

* Ruby version

The version of ruby that is needed for this project is 

+ 3.1.1

### Setup

Once you have installed them, you need to use the following command to clone the repository:

```git clone https://github.com/Yothu/budget-app-capstone.git```

### Database creation

Next, use this command to create the databases:
```rake db:create```

Use this command to run the migrations if necesessary:
```rails db:migrate```
### Install

### Usage

Finally, use the following command to initialize the live server:

```rails s```


#### Splash page

First page an unloged user will usually access, at the bottom there are two buttons, **LOGIN** and **SIGNUP**, the first one to access an already created account, and the second to create an account.

#### Categories page

Once you have created or re accessed your account, you will be redirected to the **Categories page**, in it you will be able to see you recorded *categories*, for each category you can check the name, date of creation, its icon and the total amount of money transactioned.
At the bottom of the page there is a button that says **ADD CATEGORY** that redirects you to the **Add Category** page.
If you press a category you will be redirected to the **Transactions page**


#### Add Category page

In here you can add a category, just provide a name and an icon, then press *Save*. If you gave correct data, it will redirect you to the *Categories page*.

#### Transactions page

In here you can see the transactions recorded in a category, for each transaction you can see its name, date of creation and amount of money. Just below the toolbar you will see the total amount of transactioned money in that category.
At the bottom of the page is a button that says **ADD TRANSACTION** that will redirect you to the **Add Transaction page**

#### Add Transaction page

In here you can add a transaction to multiple categories, just add the name, amount and select at least one category. If you gave correct data, it will redirect you to the *Transactions page*

### Run tests

To check the test use the following command:

```bundle exec rspec ./spec```

## Author

👤 **David Vergaray**

- GitHub:   [@Yothu](https://github.com/Yothu)
- Twiter:   [@Daivhy](https://twitter.com/Daivhy)
- LinkedIn: [David Vergaray](https://www.linkedin.com/in/david-vergaray-almontes-051a11127/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thanks to my family for all the support that thay give me.

## 📝 License

This project is [MIT](./MIT.md) licensed.
