require("recursion_homework")

describe "recursion_homework" do
    describe "exercise 1 - sum_to" do
        it "should use recursion to calculate the sum from 1 to n (inclusive of n)" do
            expect(sum_to(5)).to eq(15)
            expect(sum_to(1)).to eq(1)
            expect(sum_to(9)).to eq(45)
            expect(sum_to(-8)).to eq(nil)
        end
    end

    describe "exercise 2 - add_numbers" do
        it "should use recursion to take in an array of Integers and return the sum of those numbers" do
            expect(add_numbers([1, 2, 3, 4])).to eq(10)
            expect(add_numbers([3])).to eq(3)
            expect(add_numbers([-80, 34, 7])).to eq(-39)
            expect(add_numbers([])).to eq(nil)
        end
    end

    describe "exercise 3 - gamma_function" do
        it "should solve the Gamma Function recursively" do
            expect(gamma_function(0)).to eq(nil)
            expect(gamma_function(1)).to eq(1)
            expect(gamma_function(4)).to eq(6)
            expect(gamma_function(8)).to eq(5040)
        end
    end

    describe "exercise 4 - ice_cream_shop" do
        it "should takes in an array of ice cream flavors available at the ice cream shop and the user's favorite ice cream flavor and use recursion to find out whether or not the shop offers their favorite flavor" do
            expect(ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')).to eq(false)
            expect(ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')).to eq(true)
            expect(ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')).to eq(false)
            expect(ice_cream_shop(['moose tracks'], 'moose tracks')).to eq(true)
            expect(ice_cream_shop([], 'honey lavender')).to eq(false)
        end
    end

    describe "exercise 5 - reverse" do
        it "should take in a string and return it reversed using recursion" do
            expect(reverse("house")).to eq("esuoh")
            expect(reverse("dog")).to eq("god")
            expect(reverse("atom")).to eq("mota")
            expect(reverse("q")).to eq("q")
            expect(reverse("id")).to eq("di")
            expect(reverse("")).to eq("")
        end
    end
end