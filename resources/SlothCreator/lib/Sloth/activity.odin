/*
Abstract:
An activity a sloth may perform.
*/
package Sloth

/// A measure of a sloth's speed during an activity.
///
/// ## Topics
///
/// ### Speeds
///
/// - ``Slow``
/// - ``Medium``
/// - ``Fast``
/// - ``Supersonic``
///
/// ### Comparing Speeds
///
/// - ``odin:docs/overview/#comparison-operators``
Speed :: enum {
    /// Moves slightly faster than a snail.
    Slow,
    /// Moves at an average speed.
    Medium,
    /// Moves faster than a hare.
    Fast,
    /// Moves faster than the speed of sound.
    Supersonic,
}