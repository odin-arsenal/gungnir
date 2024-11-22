/*
Abstract:
A representation of a schedule of events that provide care for a sloth.
*/

package Sloth

/// An action a sloth can perform.
Event :: enum {
    /// A meal that a sloth usually eats at the start of their day, in the morning.
    Breakfast,
    /// A meal that a sloth usually eats around the middle of the day, in the early afternoon.
    Lunch,
    /// A meal that a sloth usually eats at the end of the day, in the evening.
    Dinner,
    /// Time for sleep.
    Bedtime,
}

/// A schedule to maintain the health and happiness of a sloth.
Schedule :: struct {
    /// The actions a sloth performs at scheduled times.
    events: map[int]Event
}

/// Creates a care schedule with the specified events.
/// - Parameter events: The actions a sloth performs at scheduled times.
init_schedule :: proc(events: map[int]Event) -> Schedule {
    return Schedule{events = events}
}