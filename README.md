# Checkout Kata Ruby

- [Instructions](#instructions)
- [How to use this solution](#how-to-use-this-solution)

## Instructions

A physical store which sells 3 products:

``` 
Code         | Name                |  Price
-------------------------------------------------
VOUCHER      | Cabify Voucher      |   5.00€
TSHIRT       | Cabify T-Shirt      |  20.00€
MUG          | Cafify Coffee Mug   |   7.50€
```

Various departments have insisted on the following discounts:

 * The marketing department believes in 2-for-1 promotions (buy two of the same product, get one free), and would like for there to be a 2-for-1 special on `VOUCHER` items.

 * The CFO insists that the best way to increase sales is with discounts on bulk purchases (buying x or more of a product, the price of that product is reduced), and demands that if you buy 3 or more `TSHIRT` items, the price per unit should be 19.00€.

The checkout process allows for items to be scanned in any order, and should return the total amount to be paid. The interface for the checkout process looks like this (ruby):

```ruby
co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total
```

Using ruby (>= 2.0), implement a checkout process that fulfills the requirements.

Examples:

    Items: VOUCHER, TSHIRT, MUG
    Total: 32.50€

    Items: VOUCHER, TSHIRT, VOUCHER
    Total: 25.00€

    Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
    Total: 81.00€

    Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
    Total: 74.50€

## How to use this solution

This implementation was developed using [Ruby 2.3.0](https://www.ruby-lang.org/)

You also need [Bundler](http://bundler.io/) for dependency management. Remember to run `bundle install`

To run the application in the shell use `ruby checkout_shell.rb [Input]`. For example: `ruby checkout_shell.rb "VOUCHER" "TSHIRT" "MUG"`

To run all tests use `bundle exec rake test`

To autorun tests while you develop run `bundle exec guard`
