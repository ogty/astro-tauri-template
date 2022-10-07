BEGIN {
    numbers[0] = "Zero";
    numbers[1] = "One";
    numbers[2] = "Two";
    numbers[3] = "Three";
    numbers[4] = "Four";
    numbers[5] = "Five";
    numbers[6] = "Six";
    numbers[7] = "Seven";
    numbers[8] = "Eight";
    numbers[9] = "Nine";
    numbers[45] = "FortyFive";
    numbers[90] = "Ninety";
}

function capitalize(word) {
    first_character = substr(word, 0, 1);
    after_second_character = substr(word, 2);
    capitalized = sprintf("%s%s", toupper(first_character), after_second_character);
    return capitalized;
}
                                                                                         
{
    split($0, array, "-");
    array_length = length(array);

    for (i = 1; i <= array_length; i += 1) {
        capitalized = capitalize(array[i]);
        for (number in numbers) {
            gsub(number, numbers[number], capitalized);
        }
        printf(capitalized);
    }
}
