-- NEXORA AvisBoost : à exécuter UNE fois dans Supabase > SQL Editor
create table if not exists public.avis (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  client text not null check (char_length(client) between 1 and 120),
  note integer not null check (note between 1 and 5),
  commentaire text not null check (char_length(commentaire) between 1 and 2000),
  reponse text check (reponse is null or char_length(reponse) <= 2000),
  created_at timestamptz not null default now()
);
create index if not exists avis_user_created_idx on public.avis (user_id, created_at desc);
alter table public.avis enable row level security;
drop policy if exists "avis_select_own" on public.avis;
drop policy if exists "avis_insert_own" on public.avis;
drop policy if exists "avis_update_own" on public.avis;
drop policy if exists "avis_delete_own" on public.avis;
create policy "avis_select_own" on public.avis for select to authenticated using ((select auth.uid()) = user_id);
create policy "avis_insert_own" on public.avis for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "avis_update_own" on public.avis for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "avis_delete_own" on public.avis for delete to authenticated using ((select auth.uid()) = user_id);
