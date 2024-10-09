@isTest
public class BusScheduleCachetest {

    @isTest
    static void testPutAndGetSchedule() {
        // Initialize the BusScheduleCache class
        BusScheduleCache cache = new BusScheduleCache();

        // Define a bus schedule to store in the cache
        Time[] testSchedule = new Time[] { Time.newInstance(9, 0, 0, 0), Time.newInstance(18, 0, 0, 0) };

        // Put the schedule in the cache
        Test.startTest();
        cache.putSchedule('Route101', testSchedule);
        Test.stopTest();

        // Retrieve the schedule from the cache
        Time[] retrievedSchedule = cache.getSchedule('Route101');

        // Verify that the cache is behaving correctly
        if (retrievedSchedule == null) {
            // If cache returns null, assert that it properly falls back to the default schedule
            Time[] expectedDefault = new Time[] { Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0) };
            System.assertEquals(expectedDefault, retrievedSchedule, 'Cache miss should return default schedule');
        } else {
            // If the cache is working, ensure the retrieved schedule matches the one we stored
            System.assertEquals(testSchedule, retrievedSchedule, 'Stored schedule should match retrieved schedule');
        }
    }

    @isTest
    static void testCacheMiss() {
        // Initialize the BusScheduleCache class
        BusScheduleCache cache = new BusScheduleCache();

        // Retrieve a schedule for a bus line that does not exist in the cache (cache miss)
        Test.startTest();
        Time[] defaultSchedule = cache.getSchedule('NonExistentRoute');
        Test.stopTest();

        // Define the expected default schedule
        Time[] expectedDefault = new Time[] { Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0) };

        // Assert that the returned schedule matches the default schedule
        System.assertEquals(expectedDefault, defaultSchedule, 'Cache miss should return default schedule');
    }
}
