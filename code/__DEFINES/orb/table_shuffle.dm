/*
	Provides a bitfield of options on how table shuffle works
*/

#define SHUFFLE_NOTHING			0
#define SHUFFLE_ALL				(~0)

#define SHUFFLE_FROM_TABLES		(1<<0)
#define SHUFFLE_FROM_RACKS		(1<<1) // some areas such as tech storage use racks differently to how they use tables, and we should respect that
#define SHUFFLE_FROM_CLOSETS	(1<<2)
#define SHUFFLE_FROM_VENDING	(1<<3)
#define SHUFFLE_FROM_BOXES		(1<<4)
#define SHUFFLE_TO_TABLES		(1<<5)
#define SHUFFLE_TO_RACKS		(1<<6)
#define SHUFFLE_TO_CLOSETS		(1<<7)
#define SHUFFLE_TO_FURNITURE	(1<<8) // also flat surface machines that take up a whole tile, even if you can't place items on them normally
#define SHUFFLE_TO_PLUMBING		(1<<9) // sinks, toilets, showers, scrubbers
#define SHUFFLE_DECAY			(1<<10)
#define SHUFFLE_VISUAL			(1<<11)
#define SHUFFLE_EXTRA_MOVING	(1<<12)
#define SHUFFLE_EXTRA_VENDING	(1<<13)

// options are &ed by this mask if vend only is configured
// Should remove all non-vending sources and any other movement-oriented flags
#define SHUFFLE_VEND_ONLY_MASK	(SHUFFLE_ALL & ~(SHUFFLE_FROM_TABLES | SHUFFLE_FROM_RACKS | SHUFFLE_FROM_CLOSETS | SHUFFLE_FROM_BOXES | SHUFFLE_VISUAL | SHUFFLE_EXTRA_MOVING))

// These common definitions are used in the areas configuration
#define SHUFFLE_STANDARD		(SHUFFLE_ALL & ~(SHUFFLE_TO_CLOSETS | SHUFFLE_EXTRA_MOVING | SHUFFLE_EXTRA_VENDING))
#define SHUFFLE_SENSITIVE		(SHUFFLE_ALL & ~(SHUFFLE_FROM_TABLES | SHUFFLE_FROM_BOXES | SHUFFLE_TO_FURNITURE | SHUFFLE_TO_PLUMBING- SHUFFLE_DECAY | SHUFFLE_VISUAL | SHUFFLE_EXTRA_MOVING | SHUFFLE_EXTRA_VENDING))
#define SHUFFLE_RACK_STORAGE	(SHUFFLE_ALL & ~(SHUFFLE_FROM_RACKS | SHUFFLE_TO_RACKS | SHUFFLE_EXTRA_MOVING | SHUFFLE_EXTRA_VENDING))
#define SHUFFLE_CRATE_STORAGE	(SHUFFLE_ALL & ~(SHUFFLE_FROM_CLOSETS | SHUFFLE_TO_CLOSETS | SHUFFLE_EXTRA_MOVING | SHUFFLE_EXTRA_VENDING))
