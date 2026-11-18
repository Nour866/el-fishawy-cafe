-- El Fishawy production database starter (Supabase / PostgreSQL)
-- Apply only after creating a Supabase project and reviewing security policies.

create table public.customers (
  id uuid primary key default gen_random_uuid(),
  member_code text unique not null,
  cups integer not null default 0 check (cups between 0 and 5),
  free_coffees integer not null default 0,
  created_at timestamptz not null default now()
);

create table public.stamp_events (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid not null references public.customers(id),
  event_type text not null check (event_type in ('cup_added','reward_redeemed')),
  staff_user_id uuid,
  created_at timestamptz not null default now()
);

create table public.offers (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  body text not null,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

-- IMPORTANT:
-- Do not expose customer updates directly to anonymous clients.
-- In production, add Supabase Auth for staff, RLS policies, and a server-side
-- Edge Function that validates staff permissions before adding stamps/redeeming.
-- Keep member_code unguessable and do not let a customer mint stamps for themselves.
