# El Fishawy Café — PWA starter

## What is included
- Arabic RTL customer loyalty interface in a warm coffee/brown/beige theme.
- Anonymous local customer ID (no phone/email/password).
- Personal QR code for the customer.
- Five-cup progress card.
- Demo admin screen to scan or enter a member code and add a cup.
- Demo offers list and browser notification permission button.
- PWA manifest and service worker.
- Starter PostgreSQL schema for a future Supabase backend.

## Run locally
A service worker and camera scanning require a secure context (HTTPS or localhost).
For a quick local preview:
1. Install Python 3.
2. In this folder run: `python -m http.server 8000`
3. Open `http://localhost:8000` in a browser.

The QR libraries are loaded from public CDNs, so an internet connection is needed for QR display/scanning.

## Important prototype limitations
This is a FRONT-END DEMO, not a production multi-customer loyalty system:
- Data is stored in this browser's localStorage. Different customers' phones do not share data.
- The demo admin PIN is `2468` and is visible in the front-end source. It is NOT secure.
- Offers only appear on the same browser/device storage. Real push notifications to all customers need a push service and backend.
- A real deployment needs HTTPS, a hosted domain, Supabase (or equivalent), staff authentication, server-side validation, database security policies, backups, and a redemption audit trail.
- A customer should not be able to add cups or redeem rewards from their own phone. Only authorized staff actions should change balances.
- If anonymous customers clear browser data or change device, their local demo account may be lost. Production should add an optional recovery mechanism.

## Suggested production flow
1. Customer scans a public registration QR that opens the hosted PWA.
2. Backend creates an anonymous customer record and issues a random member token.
3. Customer's PWA stores the session and displays a personal QR.
4. Staff logs in to a protected staff dashboard and scans the personal QR.
5. A server-side function validates staff access and writes a stamp event.
6. At five stamps, the backend marks one reward as available. Staff redeems it once, with an audit record.
7. Push provider sends opted-in customers targeted offers.

## Brand
El Fishawy Café — espresso brown, cream beige, muted gold.
