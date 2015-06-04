require_relative './spec_helper'

describe Money do
  describe "Equality" do
    it "is equal to itself" do
      money = Money.new(10,40)
      expect(money).to eq(money)
    end

    it "with equal rupee and paise are equal" do
      money1 = Money.new(10,40)
      money2 = Money.new(10,40)
      expect(money1).to eq(money2)
    end

    it "with different rupee and paise are not equal" do
      money1 = Money.new(10,40)
      money2 = Money.new(10,45)
      expect(money1).to_not eq(money2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise" do
      money1 = Money.new(1,40)
      money2 = Money.new(0,140)
      expect(money1).to eq(money2)
    end

    it "is not equal to nil money object" do
      money1 = Money.new(10,40)
      money2 = nil
      expect(money1).to_not eq(money2)
    end

    it "is not equal to some object" do
      money1 = Money.new(10,40)
      money2 = 5
      expect(money1).to_not eq(money2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise in terms of hash" do
      money1 = Money.new(1,40)
      money2 = Money.new(0,140)
      expect(money1.hash).to eq(money2.hash)
    end
  end

  describe "Summation" do
    it "sum of money with 5 rupees 40 paise and 1 rupee 30 paise should be equal to money with 6 rupees 70 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,30)
      money3 = Money.new(6,70)
      expect(money1 + money2).to eq(money3)
    end

    it "sum of money with 5 rupees 40 paise and 1 rupee 200 paise should be equal to money with 8 rupees 40 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,200)
      money3 = Money.new(8,40)
      expect(money1 + money2).to eq(money3)
    end

    it "sum of money with 5 rupees 40 paise and nilis equal to nil" do
      money1 = Money.new(5,40)
      money2 = nil
      money3 = nil
      expect(money1 + money2).to eq(money3)
    end
  end

  describe "Deduction" do
    it "with 5 rupees 40 paise after deduction of 1 rupee 30 paise should be equal to 4 rupees 10 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,30)
      money3 = Money.new(4,10)
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction of 2 rupee 540 paise should raise Negative Money exception" do
      money1 = Money.new(2,400)
      money2 = Money.new(2,540)
      expect {money1 - money2}.to raise_error(NegativeMoneyError)
    end

    it "with 2 rupees 400 paise after deduction of 10 rupee 40 paise should raise Negative Money exception" do
      money1 = Money.new(2,400)
      money2 = Money.new(10,40)
      expect {money1 - money2}.to raise_error(NegativeMoneyError)
    end

    it "with 2 rupees 400 paise after deduction nil should be equal to nil" do
      money1 = Money.new(2,400)
      money2 = nil
      money3 = nil
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction with some other object should be equal to nil" do
      money1 = Money.new(2,400)
      money2 = 5
      money3 = nil
      expect(money1 - money2).to eq(money3)
    end
  end

  describe "MoneyToText" do

    it "with 2 rupees 400 paise should return Rupee 2 Paise 400" do
      money = Money.new(2,440)
      expect(money.to_s).to eq("Rupee 6 Paise 40")
    end

    it "with  0 rupee 0 paisa should return empty string" do
      money = Money.new(0,0)
      expect(money.to_s).to eq("")
    end

  end

  describe "Negative Money Initialization" do
    it "with -2 rupees 40 paise should raise Negative Money exception" do
      expect {Money.new(-2,40)}.to raise_error(NegativeMoneyError)
    end

    it "with 2 rupee - 400 paisa should aise Negative Money exception" do
      expect {Money.new(2,-400)}.to raise_error(NegativeMoneyError)
    end

    it "with  -2 rupee -50 paisa aise Negative Money exception" do
      expect {Money.new(-2,-50)}.to raise_error(NegativeMoneyError)
    end
  end

  describe "Sorting of money" do
    it "should return sorted array of money given an array of money" do
      money1 = Money.new(0,80)
      money2 = Money.new(0,50)
      money3 = Money.new(0,100)
      array_money = [money1, money2, money3]
      sorted_array_money = [money2, money1, money3]
      expect(Money.money_sort(array_money)).to eq(sorted_array_money)
    end
  end

end