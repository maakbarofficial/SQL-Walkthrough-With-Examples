/*

CHAR -> String (0-255) - Store Fixed Length Character => CHAR(50)
VARCHAR -> String (0-255) - Store Given Length Character => VARCHAR(50) (Prefer over CHAR to save memory)
BLOB -> String (0-65535) - Store Binary large Object => BLOB(1000)
INT -> Int (-2147483647 - 2147483647) - Store Int => INT
BIGINT -> Int (-9223372036854775808 - 9223372036854775807) - Store Big Int => BIGINT
BIT - Store x-bit values, x can range from 1 to 64 => BIT(2)
FLOAT -> Store Decimal number with precision to 23 digits => FLOAT
DOUBLE -> Store Decimal number with precision 24 to 53 digits => DOUBLE
BOOLEAN -> Store true or false, 0 or 1 => BOOLEAN (Can't directly store boolean we have to use TINYINT to store boolean)
DATE -> Date in format of YYYY-MM-DD ranging from 1000-01-01 to  9999-12-31 => DATE
YEAR -> year in 4 digits formate ranging from 1901 to 2155 => YEAR

SIGNED -> -ve and +ve for numbers datatype
UNSIGNED -> only +ve for numbers datatype e.g age, salery and use to increase a range for tinyint from -128-127 to 0 - 255

*/