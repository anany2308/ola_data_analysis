
----------------------------------------------------------
-- Q1. Retrieve all successful bookings
----------------------------------------------------------

SELECT *
FROM bookings
WHERE Booking_Status = 'Success';


----------------------------------------------------------
-- Q2. Find the average ride distance for each vehicle type
----------------------------------------------------------

SELECT
    Vehicle_Type,
    ROUND(AVG(Ride_Distance),2) AS Avg_Ride_Distance
FROM bookings
GROUP BY Vehicle_Type
ORDER BY Avg_Ride_Distance DESC;


----------------------------------------------------------
-- Q3. Get the total number of cancelled rides by customers
----------------------------------------------------------

SELECT
    COUNT(*) AS Total_Cancelled_Rides
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';


----------------------------------------------------------
-- Q4. List the Top 5 customers who booked the highest
--    number of rides
----------------------------------------------------------

SELECT
    Customer_ID,
    COUNT(Booking_ID) AS Total_Rides
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;


----------------------------------------------------------
-- Q5. Count rides cancelled by drivers due to
--     personal and car-related issues
----------------------------------------------------------

SELECT
    COUNT(*) AS Driver_Cancelled_Rides
FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';


----------------------------------------------------------
-- Q6. Find the maximum and minimum driver ratings
--     for Prime Sedan bookings
----------------------------------------------------------

SELECT
    MAX(Driver_Ratings) AS Highest_Driver_Rating,
    MIN(Driver_Ratings) AS Lowest_Driver_Rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';


----------------------------------------------------------
-- Q7. Retrieve all rides where payment was made using UPI
----------------------------------------------------------

SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';


----------------------------------------------------------
-- Q8. Find the average customer rating
--     for each vehicle type
----------------------------------------------------------

SELECT
    Vehicle_Type,
    ROUND(AVG(Customer_Rating),2) AS Avg_Customer_Rating
FROM bookings
GROUP BY Vehicle_Type
ORDER BY Avg_Customer_Rating DESC;


----------------------------------------------------------
-- Q9. Calculate the total booking value of
--     successfully completed rides
----------------------------------------------------------

SELECT
    SUM(Booking_Value) AS Total_Successful_Booking_Value
FROM bookings
WHERE Booking_Status = 'Success';


----------------------------------------------------------
-- Q10. List all incomplete rides along
--      with the reason
----------------------------------------------------------

SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
