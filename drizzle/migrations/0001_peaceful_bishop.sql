CREATE TYPE "public"."day_of_week" AS ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday');--> statement-breakpoint
ALTER TABLE "scheduleAvailabilities" RENAME TO "schedule_availabilities";--> statement-breakpoint
ALTER TABLE "events" RENAME COLUMN "durationInMinutes" TO "duration_in_minutes";--> statement-breakpoint
ALTER TABLE "events" RENAME COLUMN "clerkUserId" TO "clerk_user_id";--> statement-breakpoint
ALTER TABLE "events" RENAME COLUMN "isActive" TO "is_active";--> statement-breakpoint
ALTER TABLE "events" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "events" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "schedule_availabilities" RENAME COLUMN "scheduleId" TO "schedule_id";--> statement-breakpoint
ALTER TABLE "schedule_availabilities" RENAME COLUMN "startTime" TO "start_time";--> statement-breakpoint
ALTER TABLE "schedule_availabilities" RENAME COLUMN "endTime" TO "end_time";--> statement-breakpoint
ALTER TABLE "schedule_availabilities" RENAME COLUMN "dayOfWeek" TO "day_of_week";--> statement-breakpoint
ALTER TABLE "schedules" RENAME COLUMN "clerkUserId" TO "clerk_user_id";--> statement-breakpoint
ALTER TABLE "schedules" RENAME COLUMN "createdAt" TO "created_at";--> statement-breakpoint
ALTER TABLE "schedules" RENAME COLUMN "updatedAt" TO "updated_at";--> statement-breakpoint
ALTER TABLE "schedules" DROP CONSTRAINT "schedules_clerkUserId_unique";--> statement-breakpoint
ALTER TABLE "schedule_availabilities" DROP CONSTRAINT "scheduleAvailabilities_scheduleId_schedules_id_fk";
--> statement-breakpoint
DROP INDEX "clerkUserIdIndex";--> statement-breakpoint
DROP INDEX "scheduleIdIndex";--> statement-breakpoint
ALTER TABLE "schedule_availabilities" ADD CONSTRAINT "schedule_availabilities_schedule_id_schedules_id_fk" FOREIGN KEY ("schedule_id") REFERENCES "public"."schedules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "events_clerk_user_id_idx" ON "events" USING btree ("clerk_user_id");--> statement-breakpoint
CREATE INDEX "schedule_availabilities_schedule_id_idx" ON "schedule_availabilities" USING btree ("schedule_id");--> statement-breakpoint
ALTER TABLE "schedules" ADD CONSTRAINT "schedules_clerk_user_id_unique" UNIQUE("clerk_user_id");--> statement-breakpoint
DROP TYPE "public"."day";