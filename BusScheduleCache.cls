public class BusScheduleCache {
    // Declare the partition class variable
    private Cache.OrgPartition part;

    // Constructor to initialize the OrgPartition object
    public BusScheduleCache() {
        // Initialize the partition object with the name 'local.BusSchedule'
        this.part = Cache.Org.getPartition('local.BusSchedule');
    }

    // Method to put a bus schedule in the cache
    public void putSchedule(String busLine, Time[] schedule) {
        // Store the schedule in the org cache using the partition object
        part.put(busLine, schedule);
    }

    // Method to retrieve a bus schedule from the cache
    public Time[] getSchedule(String busLine) {
        // Retrieve the schedule from the org cache
        Time[] schedule = (Time[])part.get(busLine);

        // Check if the schedule is null (cache miss)
        if (schedule == null) {
            // Return default schedule: 8 AM and 5 PM
            schedule = new Time[] { Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0, 0, 0) };
        }

        return schedule;
    }
}
