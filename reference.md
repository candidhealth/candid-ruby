# Reference
## Auth Default
<details><summary><code>client.auth.default.get_token(request) -> Candid::Auth::Default::Types::AuthGetTokenResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

<Callout intent="info">
Candid Health SDKs automatically handle authentication workflows after configuring them with the `client_id` and
`client_secret`.
</Callout>

Candid Health utilizes the [OAuth 2.0 bearer token authentication scheme](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) in our auth flow. You obtain the bearer token for all
subsequent API requests via the `/auth/v2/token` endpoint defined below, which requires you to provide your `client_id` and `client_secret`. Your `client_id` and `client_secret` can be [generated](https://support.joincandidhealth.com/hc/en-us/articles/23065219476244--Generating-Candid-API-Keys) from the "Users & Credentials" tab by your org admin.

The `/auth/v2/token` endpoint accepts both `Content-Type: application/json` and `Content-Type: application/x-www-form-urlencoded`. The request body should contain the `client_id` and `client_secret` as follows:

```json
{
  "client_id": "YOUR_CLIENT_ID",
  "client_secret": "YOUR_CLIENT_SECRET"
}
```
or as URL-encoded form data:

```
client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET
```

The bearer token is a signed [JWT](https://jwt.io/). The public key for the JWT can be found [here](https://candidhealth.auth0.com/pem) for any verification workflows.

The bearer token should be provided in the `Authorization` header for all subsequent API calls.

<Callout intent="warning">
The bearer token expires 5 hours after it has been created. After it has expired, the client will receive an "HTTP 401
Unauthorized" error, at which point the client should generate a new token. It is important that tokens be reused between
requests; if the client attempts to generate a token too often, it will be rate-limited and will receive an `HTTP 429 Too Many Requests` error.
</Callout>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.auth.default.get_token(
  clientId: 'YOUR_CLIENT_ID',
  clientSecret: 'YOUR_CLIENT_SECRET'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_id:** `String` — Your application's Client ID.
    
</dd>
</dl>

<dl>
<dd>

**client_secret:** `String` — Your application's Client Secret.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BillingNotes V2
<details><summary><code>client.billing_notes.v_2.create(request) -> Candid::BillingNotes::V2::Types::BillingNote</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.billing_notes.v_2.create(
  text: 'text',
  encounterId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing_notes.v_2.delete(billing_note_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.billing_notes.v_2.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**billing_note_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.billing_notes.v_2.update(billing_note_id, request) -> Candid::BillingNotes::V2::Types::BillingNote</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.billing_notes.v_2.update(
  billingNoteId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  text: 'text'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**billing_note_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `String` — Empty string not allowed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChargeCaptureBundles V1
<details><summary><code>client.charge_capture_bundles.v_1.get(charge_capture_claim_creation_id) -> Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreation</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture_bundles.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**charge_capture_claim_creation_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture_bundles.v_1.get_summary() -> Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSummary</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture_bundles.v_1.get_summary();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture_bundles.v_1.resolve_charge_creation_error(charge_capture_bundle_error_id, request) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture_bundles.v_1.resolve_charge_creation_error(chargeCaptureBundleErrorId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**charge_capture_bundle_error_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**resolved_by:** `String` — A string, denoting who resolved the error for audit trail purposes.
    
</dd>
</dl>

<dl>
<dd>

**resolution_reason:** `String` — A string denoting why or how the error was dealt with for audit trail purposes.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture_bundles.v_1.get_all() -> Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture_bundles.v_1.get_all();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSortField` — Defaults to created_at
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` — The patient ID from the external EMR platform for the patient
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_status:** `Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus` — the status of the charge capture Claim Creation, refers to whether it was able to create a claim.
    
</dd>
</dl>

<dl>
<dd>

**charge_status:** `Candid::ChargeCapture::V1::Types::ChargeCaptureStatus` — the status of the charge captures
    
</dd>
</dl>

<dl>
<dd>

**charge_external_id:** `String` 

A client-specified unique ID to associate with this encounter;
for example, your internal encounter ID or a Dr. Chrono encounter ID.
This field should not contain PHI.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_min:** `String` 

Date formatted as YYYY-MM-DD; eg: 2019-08-24.
This date must be the local date in the timezone where the service occurred.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_max:** `String` 

Date formatted as YYYY-MM-DD; eg: 2019-08-24.
This date must be the local date in the timezone where the service occurred.
    
</dd>
</dl>

<dl>
<dd>

**claim_ids:** `String` — A list of claim IDs to filter by. This will return all charge capture claim_creations that have a resulting claim with one of the IDs in this list.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_ids:** `String` — A list of Claim Creation IDs to filter by.
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_npis:** `String` — A list of billing provider NPIs to filter by. This will return all charge capture claim_creations which include one or more charges with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**service_facility_name:** `String` — A string to filter by. This will return all charge capture claim_creations which include one or more charges with this service facility name.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_ids:** `String` — A list of primary payer IDs to filter by. This will return all charge capture claim_creations which include one or more charges with one of the primary payer IDs in this list.
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_npis:** `String` — A list of rendering provider NPIs to filter by. This will return all charge capture claim_creations which include one or more charges with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_names:** `String` — A list of rendering provider names to filter by. This will return all charge capture claim_creations which include one or more charges with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**supervising_provider_npis:** `String` — A list of supervising provider NPIs to filter by. This will return all charge capture claim_creations which include one or more charges with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**supervising_provider_names:** `String` — A list of supervising provider names to filter by. This will return all charge capture claim_creations which include one or more charges with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**claim_status:** `Candid::Claims::Types::ClaimStatus` — the status of the claim to filter by created from charge capture bundle.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_category:** `String` — A list of claim creation categories to filter by. This will return all charge capture claim_creations which include one or more charges with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**tags:** `String` — A list of tags to filter by. This will return all charge captures with one of the tags.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_names:** `String` — A list of primary payer names to filter by. This will return all charge captures with one of the names.
    
</dd>
</dl>

<dl>
<dd>

**patient_names:** `String` — A list of patient names to filter by. This will return all charge captures with one of the names.
    
</dd>
</dl>

<dl>
<dd>

**has_charge_capture_updates:** `Internal::Types::Boolean` — If true, only return claim_creations that have charge captures that have been updated since the Claim Creation has had a status of BILLED. See the updates property on ChargeCapture for more details.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChargeCapture V1
<details><summary><code>client.charge_capture.v_1.create(request) -> Candid::ChargeCapture::V1::Types::ChargeCapture</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture.v_1.create(
  data: {},
  chargeExternalId: 'charge_external_id',
  patientExternalId: 'patient_external_id',
  status: 
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**data:** `Candid::ChargeCapture::V1::Types::ChargeCaptureData` — Charge Capture data contains all the fields needed to create an encounter, but listed as optional. Candid will use this data when attempting to bundle multiple Charge Captures into a single encounter.
    
</dd>
</dl>

<dl>
<dd>

**charge_external_id:** `String` — A client-specified unique ID to associate with this encounter; for example, your internal encounter ID or a Dr. Chrono encounter ID. This field should not contain PHI.
    
</dd>
</dl>

<dl>
<dd>

**originating_system:** `String` — An optional string field denoting the originating system of the charge.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_category:** `String` — An optional string field denoting the user defined category of the claim creation.
    
</dd>
</dl>

<dl>
<dd>

**ehr_source_url:** `String` — External URL reference that links to Charge Capture details within the external system (e.g. the EHR visit page). Send full URL format for the external link (e.g. https://emr_charge_capture_url.com/123).
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` — The patient ID from the external EMR platform for the patient
    
</dd>
</dl>

<dl>
<dd>

**status:** `Candid::ChargeCapture::V1::Types::ChargeCaptureStatus` — the status of the charge capture
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture.v_1.create_from_pre_encounter_patient(request) -> Candid::ChargeCapture::V1::Types::ChargeCapture</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a Charge Capture from a pre-encounter patient and appointment. This endpoint is intended to be used by consumers who are managing
patients and appointments in the pre-encounter service and is currently under development. Consumers who are not taking advantage
of the pre-encounter service should use the standard create endpoint.

At encounter creation time, information from the provided patient and appointment objects will be populated
where applicable. In particular, the following fields are populated from the patient and appointment objects:
  - Patient
  - Referring Provider
  - Subscriber Primary
  - Subscriber Secondary
  - Referral Number
  - Responsible Party
  - Guarantor

Note that these fields should not be populated in the ChargeCaptureData property of this endpoint, as they will be overwritten at encounter creation time.

Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is updated, assuming the
encounter has not already been submitted or adjudicated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture.v_1.create_from_pre_encounter_patient(
  data: {},
  chargeExternalId: 'charge_external_id',
  preEncounterPatientId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  preEncounterAppointmentIds: ['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32', 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'],
  status: 
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**data:** `Candid::ChargeCapture::V1::Types::ChargeCaptureData` — Charge Capture data contains all the fields needed to create an encounter, but listed as optional. Candid will use this data when attempting to bundle multiple Charge Captures into a single encounter.
    
</dd>
</dl>

<dl>
<dd>

**charge_external_id:** `String` — A client-specified unique ID to associate with this encounter; for example, your internal encounter ID or a Dr. Chrono encounter ID. This field should not contain PHI.
    
</dd>
</dl>

<dl>
<dd>

**pre_encounter_patient_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**pre_encounter_appointment_ids:** `Internal::Types::Array[String]` 
    
</dd>
</dl>

<dl>
<dd>

**originating_system:** `String` — An optional string field denoting the originating system of the charge.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_category:** `String` — An optional string field denoting the user defined category of the claim creation.
    
</dd>
</dl>

<dl>
<dd>

**ehr_source_url:** `String` — External URL reference that links to Charge Capture details within the external system (e.g. the EHR visit page). Send full URL format for the external link (e.g. https://emr_charge_capture_url.com/123).
    
</dd>
</dl>

<dl>
<dd>

**status:** `Candid::ChargeCapture::V1::Types::ChargeCaptureStatus` — the status of the charge capture
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture.v_1.update(charge_capture_id, request) -> Candid::ChargeCapture::V1::Types::ChargeCapture</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture.v_1.update(chargeCaptureId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**charge_capture_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**data:** `Candid::ChargeCapture::V1::Types::ChargeCaptureData` 
    
</dd>
</dl>

<dl>
<dd>

**charge_external_id:** `String` 

A client-specified unique ID to associate with this encounter;
for example, your internal encounter ID or a Dr. Chrono encounter ID.
This field should not contain PHI.
    
</dd>
</dl>

<dl>
<dd>

**ehr_source_url:** `String` 

External URL reference that links to Charge Capture details within the external system (e.g. the EHR visit page).
Send full URL format for the external link (e.g. https://emr_charge_capture_url.com/123).
    
</dd>
</dl>

<dl>
<dd>

**originating_system:** `String` — An optional string field denoting the originating system of the charge.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_category:** `String` — An optional string field denoting the user defined category of the claim creation.
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` — The patient ID from the external EMR platform for the patient
    
</dd>
</dl>

<dl>
<dd>

**status:** `Candid::ChargeCapture::V1::Types::ChargeCaptureStatus` — the status of the charge capture
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture.v_1.get(charge_capture_id) -> Candid::ChargeCapture::V1::Types::ChargeCapture</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**charge_capture_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture.v_1.get_all() -> Candid::ChargeCapture::V1::Types::ChargeCapturePage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture.v_1.get_all();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::ChargeCapture::V1::Types::ChargeCaptureSortField` — Defaults to created_at
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` — The patient ID from the external EMR platform for the patient
    
</dd>
</dl>

<dl>
<dd>

**status:** `Candid::ChargeCapture::V1::Types::ChargeCaptureStatus` — the status of the charge captures
    
</dd>
</dl>

<dl>
<dd>

**charge_external_id:** `String` 

A client-specified unique ID to associate with this encounter;
for example, your internal encounter ID or a Dr. Chrono encounter ID.
This field should not contain PHI.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_min:** `String` 

Date formatted as YYYY-MM-DD; eg: 2019-08-24.
This date must be the local date in the timezone where the service occurred.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_max:** `String` 

Date formatted as YYYY-MM-DD; eg: 2019-08-24.
This date must be the local date in the timezone where the service occurred.
    
</dd>
</dl>

<dl>
<dd>

**claim_ids:** `String` — A list of claim IDs to filter by. This will return all charge captures that have a resulting claim with one of the IDs in this list.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_ids:** `String` — A list of Claim Creation IDs to filter by.
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_npis:** `String` — A list of billing provider NPIs to filter by. This will return all charge captures with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**service_facility_name:** `String` — A string to filter by. This will return all charge captures with this service facility name.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_ids:** `String` — A list of primary payer IDs to filter by. This will return all charge captures with one of the primary payer IDs in this list.
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_npis:** `String` — A list of rendering provider NPIs to filter by. This will return all charge captures with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_names:** `String` — A list of rendering provider names to filter by. This will return all charge captures with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**supervising_provider_npis:** `String` — A list of supervising provider NPIs to filter by. This will return all charge captures with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**supervising_provider_names:** `String` — A list of supervising provider names to filter by. This will return all charge captures with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_category:** `String` — A list of claim creation categories to filter by. This will return all charge capture claim_creations which include one or more charges with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**tags:** `String` — A list of tags to filter by. This will return all charge captures with one of the tags.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_names:** `String` — A list of primary payer names to filter by. This will return all charge captures with one of the names.
    
</dd>
</dl>

<dl>
<dd>

**patient_names:** `String` — A list of patient names to filter by. This will return all charge captures with one of the names.
    
</dd>
</dl>

<dl>
<dd>

**exclude_charges_linked_to_claims:** `Internal::Types::Boolean` — Whether to exclude charge captures which are part of a claim creation.
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id_ranked_sort:** `String` — The patient ID from the external EMR platform for the patient
    
</dd>
</dl>

<dl>
<dd>

**status_ranked_sort:** `Candid::ChargeCapture::V1::Types::ChargeCaptureStatus` — The charge capture status to show first
    
</dd>
</dl>

<dl>
<dd>

**charge_external_id_ranked_sort:** `String` 

A client-specified unique ID to associate with this encounter;
for example, your internal encounter ID or a Dr. Chrono encounter ID.
This field should not contain PHI.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_min_ranked_sort:** `String` 

Date formatted as YYYY-MM-DD; eg: 2019-08-24.
This date must be the local date in the timezone where the service occurred.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_max_ranked_sort:** `String` 

Date formatted as YYYY-MM-DD; eg: 2019-08-24.
This date must be the local date in the timezone where the service occurred.
    
</dd>
</dl>

<dl>
<dd>

**search_term:** `String` 

Filter by any of the following fields: charge_id, claim_id, patient external_id,
patient date of birth, patient first name, patient last name,
or charge external id.
    
</dd>
</dl>

<dl>
<dd>

**billable_status:** `Candid::Encounters::V4::Types::BillableStatusType` — Defines if the Encounter is to be billed by Candid to the responsible_party. Examples for when this should be set to NOT_BILLABLE include if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
    
</dd>
</dl>

<dl>
<dd>

**responsible_party:** `Candid::Encounters::V4::Types::ResponsiblePartyType` — Defines the party to be billed with the initial balance owed on the claim. Use SELF_PAY if you intend to bill self pay/cash pay.
    
</dd>
</dl>

<dl>
<dd>

**claim_ids_ranked_sort:** `String` — A list of claim IDs to show first. This will return all charge captures that have a resulting claim with one of the IDs in this list.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_ids_ranked_sort:** `String` — A list of Claim Creation IDs to show first.
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_npis_ranked_sort:** `String` — A list of billing provider NPIs to show first. This will return all charge captures with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**service_facility_name_ranked_sort:** `String` — A string to show first. This will return all charge captures with this service facility name.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_ids_ranked_sort:** `String` — A list of primary payer IDs to show first. This will return all charge captures with one of the primary payer IDs in this list.
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_npis_ranked_sort:** `String` — A list of rendering provider NPIs to show first. This will return all charge captures with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_names_ranked_sort:** `String` — A list of rendering provider names to show first. This will return all charge captures with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**supervising_provider_npis_ranked_sort:** `String` — A list of supervising provider NPIs to show first. This will return all charge captures with one of the NPIs in this list.
    
</dd>
</dl>

<dl>
<dd>

**supervising_provider_names_ranked_sort:** `String` — A list of supervising provider names to show first. This will return all charge captures with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**claim_status:** `Candid::Claims::Types::ClaimStatus` — the status of the claim to filter by created from charge capture bundle.
    
</dd>
</dl>

<dl>
<dd>

**claim_creation_category_ranked_sort:** `String` — A list of claim creation categories to sort by. This will return all charge capture claim_creations which include one or more charges with one of the names in this list.
    
</dd>
</dl>

<dl>
<dd>

**tags_ranked_sort:** `String` — A list of tags. This will return all charge captures with one of the tags.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_names_ranked_sort:** `String` — A list of primary payer names to sort by. This will return all charge captures with one of the names.
    
</dd>
</dl>

<dl>
<dd>

**patient_names_ranked_sort:** `String` — A list of patient names to sort by. This will return all charge captures with one of the names.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.charge_capture.v_1.update_post_billed_changes(request) -> Internal::Types::Array[Candid::ChargeCapture::V1::Types::ChargeCapturePostBilledChange]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.charge_capture.v_1.update_post_billed_changes(
  chargeCaptureChangeIds: ['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32', 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'],
  resolved: true
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**charge_capture_change_ids:** `Internal::Types::Array[String]` 

A list of UUIDs corresponding to ChargeCapturePostBilledChanges.
All of the charges sent will be marked as resolved
    
</dd>
</dl>

<dl>
<dd>

**resolved:** `Internal::Types::Boolean` 

Whether the change has been resolved. If true, the change will be marked as resolved.
If false, the change will be marked as unresolved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Contracts V2
<details><summary><code>client.contracts.v_2.get(contract_id) -> Candid::Contracts::V2::Types::ContractWithProviders</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contracts.v_2.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contract_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contracts.v_2.get_multi() -> Candid::Contracts::V2::Types::ContractsPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contracts.v_2.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Max number of contracts returned. Defaults to 1000. Max is 1000.
    
</dd>
</dl>

<dl>
<dd>

**contracting_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_ids:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_names:** `String` — Filter to contracts that include any of the included payer names.
    
</dd>
</dl>

<dl>
<dd>

**states:** `Candid::Commons::Types::State` 
    
</dd>
</dl>

<dl>
<dd>

**contract_status:** `Candid::Contracts::V2::Types::ContractStatus` — The status of the contract. Defaults to `pending`
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::Contracts::V2::Types::ContractSortField` — Potentially sort by a contract related attribute.  Defaults to created_at
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Direction of sort, defaulting to desc
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contracts.v_2.create(request) -> Candid::Contracts::V2::Types::ContractWithProviders</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new contract within the user's current organization
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contracts.v_2.create(
  effectiveDate: 'effective_date',
  regions: ,
  commercialInsuranceTypes: ,
  medicareInsuranceTypes: ,
  medicaidInsuranceTypes: ,
  contractingProviderId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  renderingProviderIds: Set.new(['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32']),
  payerUuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contracting_provider_id:** `String` — The UUID of the provider under agreement to the contract
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_ids:** `Internal::Types::Array[String]` 

A rendering provider isn't contracted directly with the payer but can render
services under the contract held by the contracting provider.
Max items is 4000.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — The UUID of the insurance company under agreement to the contract
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contracts.v_2.delete(contract_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contracts.v_2.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contract_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contracts.v_2.update(contract_id, request) -> Candid::Contracts::V2::Types::ContractWithProviders</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contracts.v_2.update(contractId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contract_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_ids:** `Internal::Types::Array[String]` 

A rendering provider isn't contracted directly with the payer but can render
services under the contract held by the contracting provider.
Max items is 4000.
    
</dd>
</dl>

<dl>
<dd>

**effective_date:** `String` — The starting day upon which the contract is effective
    
</dd>
</dl>

<dl>
<dd>

**expiration_date:** `Candid::Contracts::V2::Types::DateUpdate` — An optional end day upon which the contract expires
    
</dd>
</dl>

<dl>
<dd>

**regions:** `Candid::Contracts::V2::Types::RegionsUpdate` 

If present, the contract's rendering providers will be patched to this exact
value, overriding what was set before.
    
</dd>
</dl>

<dl>
<dd>

**contract_status:** `Candid::Contracts::V2::Types::ContractStatus` 
    
</dd>
</dl>

<dl>
<dd>

**authorized_signatory:** `Candid::Contracts::V2::Types::AuthorizedSignatoryUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**commercial_insurance_types:** `Candid::Contracts::V2::Types::InsuranceTypes` 
    
</dd>
</dl>

<dl>
<dd>

**medicare_insurance_types:** `Candid::Contracts::V2::Types::InsuranceTypes` 
    
</dd>
</dl>

<dl>
<dd>

**medicaid_insurance_types:** `Candid::Contracts::V2::Types::InsuranceTypes` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Credentialing V2
<details><summary><code>client.credentialing.v_2.create_facility(request) -> Candid::Credentialing::V2::Types::FacilityCredentialingSpan</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.create_facility(
  serviceFacilityId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  contractingProviderId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  payerUuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_facility_id:** `String` — The ID of the service facility covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**contracting_provider_id:** `String` — The ID of the billing provider for which the service facility is covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — The ID of the payer covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — Start date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — End date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**submitted_date:** `String` — Date that the credential paperwork was submitted.
    
</dd>
</dl>

<dl>
<dd>

**payer_loaded_date:** `String` — Date that the payer loaded the credentialing span into their system.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.get_facility(facility_credentialing_id) -> Candid::Credentialing::V2::Types::FacilityCredentialingSpan</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.get_facility();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**facility_credentialing_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.get_all_facilities() -> Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.get_all_facilities();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — Filter by payer.
    
</dd>
</dl>

<dl>
<dd>

**contracting_provider_id:** `String` — Filter to a particular contracting provider.
    
</dd>
</dl>

<dl>
<dd>

**service_facility_id:** `String` — Filter to a particular service facility.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.delete_facility(facility_credentialing_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Soft deletes a credentialing span rate from the system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.delete_facility();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**facility_credentialing_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.update_facility(facility_credentialing_id, request) -> Candid::Credentialing::V2::Types::FacilityCredentialingSpan</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.update_facility(
  facilityCredentialingId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  contractingProviderId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**facility_credentialing_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**contracting_provider_id:** `String` — The ID of the billing provider for which the service facility is covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — The ID of the payer doing the credentialing.
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — Start date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — End date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**regions:** `Candid::Commons::Types::Regions` — The states covered by the credentialing span. A span may be national and cover all states.
    
</dd>
</dl>

<dl>
<dd>

**submitted_date:** `String` — Date that the credential paperwork was submitted.
    
</dd>
</dl>

<dl>
<dd>

**payer_loaded_date:** `String` — Date that the payer loaded the credentialing span into their system.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.create(request) -> Candid::Credentialing::V2::Types::ProviderCredentialingSpan</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.create(
  renderingProviderId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  contractingProviderId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  payerUuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  regions: 
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rendering_provider_id:** `String` — The ID of the rendering provider covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**contracting_provider_id:** `String` — The ID of the billing provider for which the service facility is covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — The ID of the payer covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — Start date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — End date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**regions:** `Candid::Commons::Types::Regions` — The states covered by the credentialing span. A span may be national and cover all states.
    
</dd>
</dl>

<dl>
<dd>

**submitted_date:** `String` — Date that the credential paperwork was submitted.
    
</dd>
</dl>

<dl>
<dd>

**payer_loaded_date:** `String` — Date that the payer loaded the credentialing span into their system.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.get(provider_credentialing_id) -> Candid::Credentialing::V2::Types::ProviderCredentialingSpan</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**provider_credentialing_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.get_all() -> Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.get_all();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — Filter by payer.
    
</dd>
</dl>

<dl>
<dd>

**provider_id:** `String` — Filter to a particular provider. Use in conjunction as_rendering_provider and as_contracting_provider.
    
</dd>
</dl>

<dl>
<dd>

**as_rendering_provider:** `Internal::Types::Boolean` — Filter to credentialing spans where the provider is a rendering provider. To use this filter provider_id is required.
    
</dd>
</dl>

<dl>
<dd>

**as_contracting_provider:** `Internal::Types::Boolean` — Filter to credentialing spans where the provider is a contracting provider. To use this filter provider_id is required.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.delete(provider_credentialing_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Soft deletes a credentialing span rate from the system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**provider_credentialing_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentialing.v_2.update(provider_credentialing_id, request) -> Candid::Credentialing::V2::Types::ProviderCredentialingSpan</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentialing.v_2.update(providerCredentialingId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**provider_credentialing_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**contracting_provider_id:** `String` — The ID of the billing provider for which the service facility is covered by the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` — The ID of the payer doing the credentialing.
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — Start date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — End date of the credentialing span.
    
</dd>
</dl>

<dl>
<dd>

**regions:** `Candid::Commons::Types::Regions` — The states covered by the credentialing span. A span may be national and cover all states.
    
</dd>
</dl>

<dl>
<dd>

**submitted_date:** `String` — Date that the credential paperwork was submitted.
    
</dd>
</dl>

<dl>
<dd>

**payer_loaded_date:** `String` — Date that the payer loaded the credentialing span into their system.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CustomSchemas V1
<details><summary><code>client.custom_schemas.v_1.get_multi() -> Candid::CustomSchemas::V1::Types::SchemaGetMultiResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all custom schemas.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_schemas.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_schemas.v_1.get(schema_id) -> Candid::CustomSchemas::V1::Types::Schema</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Return a custom schema with a given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_schemas.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**schema_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_schemas.v_1.create(request) -> Candid::CustomSchemas::V1::Types::Schema</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create custom schema with a set of typed keys. Schema keys can be referenced as inputs in user-configurable rules in the Rules
Engine, and key-value pairs can be attached to claims via the Encounters API.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_schemas.v_1.create(
  name: 'General Medicine',
  description: 'Values associated with a generic visit',
  fields: [{
    key: 'provider_category'
  }, {
    key: 'is_urgent_care'
  }, {
    key: 'bmi'
  }, {
    key: 'age'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**fields:** `Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaField]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.custom_schemas.v_1.update(schema_id, request) -> Candid::CustomSchemas::V1::Types::Schema</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the name, description, or keys on a preexisting schema.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.custom_schemas.v_1.update(
  schemaId: 'ec096b13-f80a-471d-aaeb-54b021c9d582',
  name: 'General Medicine and Health',
  description: 'Values collected during all visits',
  fieldsToAdd: [{
    key: 'visit_type'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**schema_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**fields_to_add:** `Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaField]` — A list of typed entries to add to schema. Only additive modifications are permitted.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Eligibility V2
<details><summary><code>client.eligibility.v_2.submit_eligibility_check(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

<Tip>Candid is deprecating support for this endpoint. It is instead recommended to use [Candid's Stedi passthrough endpoint](https://docs.joincandidhealth.com/api-reference/pre-encounter/eligibility-checks/v-1/post).
For assistance with the transition, please reference the [Transitioning to Candid's New Eligibility Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980) document in the Candid Support Center.</Tip>

This API is a wrapper around Change Healthcare's eligibility API. Below are some helpful documentation links:

- [Change Healthcare - Guides: Contents of the Eligibility Request Body](https://developers.changehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-request-body)
- [Change Healthcare - Guides: Use "Bare Minimum" Eligibility Requests](https://developers.changehealthcare.com/eligibilityandclaims/docs/use-bare-minimum-eligibility-requests)
- [Change Healthcare - Guides: Contents of the Eligibility Response](https://developers.changehealthcare.com/eligibilityandclaims/docs/contents-of-the-eligibility-response)
- [Change Healthcare - Guides: Eligibility JSON-to-EDI API Contents](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-json-to-edi-api-contents)
- [Change Healthcare - Guides: Eligibility Error Messages](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-error-messages)
- [Change Healthcare - Guides: FAQ](https://developers.changehealthcare.com/eligibilityandclaims/docs/frequently-asked-questions)
- [Change Healthcare - Guides: Eligibility FAQs](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-api-requests)
- [Change Healthcare - Guides: Sandbox API Values and Test Responses](https://developers.changehealthcare.com/eligibilityandclaims/docs/eligibility-sandbox-api-values-and-test-responses)
- [Change Healthcare - Guides: Sandbox Predefined Fields and Values](https://developers.changehealthcare.com/eligibilityandclaims/docs/sandbox-predefined-fields-and-values)
- [Change Healthcare - Guides: Using Test Payers in the Sandbox](https://developers.changehealthcare.com/eligibilityandclaims/docs/use-the-test-payers-in-the-sandbox-api)

A schema of the response object can be found here: [Change Healthcare Docs](https://developers.changehealthcare.com/eligibilityandclaims/reference/medicaleligibility)
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.eligibility.v_2.submit_eligibility_check();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.eligibility.v_2.submit_eligibility_check_availity() -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

<Tip>Candid is deprecating support for this endpoint. It is instead recommended to use [Candid's Stedi passthrough endpoint](https://docs.joincandidhealth.com/api-reference/pre-encounter/eligibility-checks/v-1/post).
For assistance with the transition, please reference the [Transitioning to Candid's New Eligibility Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980) document in the Candid Support Center.</Tip>

**Availity has transitioned their GET endpoint to a POST endpoint. Candid has updated their pass-through integration to enable backwards compatibility for the GET endpoint so that customers do not have to immediately update their integrations.**

**Candid recommends integrations with the [POST endpoint](https://docs.joincandidhealth.com/api-reference/eligibility/v-2/submit-eligibility-check-availity-post) to ensure the best possible integration experience. Given the transition, Availity’s documentation will be out of sync with this endpoint.**

If you'd like access to this endpoint, please reach out to support@joincandidhealth.com with the subject line "Action: Activate Availity Eligibility API Endpoint

This API is a wrapper around Availity's coverages API. Below are some helpful documentation links:

- [Availity - Coverages 1.0.0 API](https://developer.availity.com/partner/documentation#c_coverages_references)
- [Candid Availity Eligibility Integration Guide](https://support.joincandidhealth.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)

A schema of the response object can be found here: [Availity Docs](https://developer.availity.com/partner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
* Note Availity requires a free developer account to access this documentation.

Check connection status of Availity API and partners here:
- [Availity Trading Partner Connection Status](https://www.availity.com/status/)
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.eligibility.v_2.submit_eligibility_check_availity();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.eligibility.v_2.submit_eligibility_check_availity_post(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

<Tip>Candid is deprecating support for this endpoint. It is instead recommended to use [Candid's Stedi passthrough endpoint](https://docs.joincandidhealth.com/api-reference/pre-encounter/eligibility-checks/v-1/post).
For assistance with the transition, please reference the [Transitioning to Candid's New Eligibility Endpoint](https://support.joincandidhealth.com/hc/en-us/articles/34918552872980) document in the Candid Support Center.</Tip>

If you'd like access to this endpoint, please reach out to support@joincandidhealth.com with the subject line "Action: Activate Availity Eligibility API Endpoint

This API is a wrapper around Availity's coverages API. Below are some helpful documentation links:

- [Availity - Coverages 1.0.0 API](https://developer.availity.com/partner/documentation#c_coverages_references)
- [Candid Availity Eligibility Integration Guide](https://support.joincandidhealth.com/hc/en-us/articles/24218441631892--Availity-Eligibility-Integration-Guide)

A schema of the response object can be found here: [Availity Docs](https://developer.availity.com/partner/product/191210/api/190898#/Coverages_100/operation/%2Fcoverages%2F{id}/get)
* Note Availity requires a free developer account to access this documentation.

Check connection status of Availity API and partners here:
- [Availity Trading Partner Connection Status](https://www.availity.com/status/)
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.eligibility.v_2.submit_eligibility_check_availity_post();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EncounterAttachments V1
<details><summary><code>client.encounter_attachments.v_1.get(encounter_id) -> Internal::Types::Array[Candid::EncounterAttachments::V1::Types::EncounterAttachment]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_attachments.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_attachments.v_1.delete(encounter_id, request) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_attachments.v_1.delete(
  encounterId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  attachmentId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**attachment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EncounterProviders V2
<details><summary><code>client.encounter_providers.v_2.update_referring_provider(encounter_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.update_referring_provider({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::ReferringProviderUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.update_initial_referring_provider(encounter_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.update_initial_referring_provider({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::InitialReferringProviderUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.update_supervising_provider(encounter_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.update_supervising_provider({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::SupervisingProviderUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.update_ordering_provider(service_line_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.update_ordering_provider({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::OrderingProviderUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.create_referring_provider(encounter_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.create_referring_provider({
  npi: 'npi'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::ReferringProvider` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.create_initial_referring_provider(encounter_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.create_initial_referring_provider({
  npi: 'npi'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::InitialReferringProvider` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.create_supervising_provider(encounter_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.create_supervising_provider({
  npi: 'npi'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::SupervisingProvider` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.create_ordering_provider(service_line_id, request) -> Candid::EncounterProviders::V2::Types::EncounterProvider</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.create_ordering_provider({
  npi: 'npi'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterProviders::V2::Types::OrderingProvider` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.delete_referring_provider(encounter_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.delete_referring_provider();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.delete_initial_referring_provider(encounter_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.delete_initial_referring_provider();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.delete_supervising_provider(encounter_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.delete_supervising_provider();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_providers.v_2.delete_ordering_provider(service_line_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_providers.v_2.delete_ordering_provider();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EncounterSupplementalInformation V1
<details><summary><code>client.encounter_supplemental_information.v_1.get(encounter_id) -> Internal::Types::Array[Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation]</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_supplemental_information.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_supplemental_information.v_1.create(encounter_id, request) -> Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_supplemental_information.v_1.create({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterSupplementalInformation::V1::Types::CreateSupplementalInformationRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_supplemental_information.v_1.update(encounter_id, supplemental_information_id, request) -> Candid::EncounterSupplementalInformation::V1::Types::SupplementalInformation</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_supplemental_information.v_1.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**supplemental_information_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::EncounterSupplementalInformation::V1::Types::UpdateSupplementalInformationRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounter_supplemental_information.v_1.delete(encounter_id, supplemental_information_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounter_supplemental_information.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**supplemental_information_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Encounters V4
<details><summary><code>client.encounters.v_4.get_all() -> Candid::Encounters::V4::Types::EncounterPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounters.v_4.get_all(
  limit: 100,
  claimStatus: ,
  sort: ,
  pageToken: 'eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9',
  dateOfServiceMin: '2019-08-24',
  dateOfServiceMax: '2019-08-25',
  primaryPayerNames: 'Medicare,Medicaid',
  searchTerm: 'doe',
  externalId: '123456',
  diagnosesUpdatedSince: '2019-08-24T14:15:22Z'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**claim_status:** `Candid::Claims::Types::ClaimStatus` — Indicates the current status of an insurance claim within the billing process.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::Encounters::V4::Types::EncounterSortOptions` — Defaults to created_at:desc.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_min:** `String` — Date formatted as YYYY-MM-DD; eg: 2019-08-25.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_max:** `String` — Date formatted as YYYY-MM-DD; eg: 2019-08-25.
    
</dd>
</dl>

<dl>
<dd>

**primary_payer_names:** `String` — Comma delimited string.
    
</dd>
</dl>

<dl>
<dd>

**search_term:** `String` 

Filter by any of the following fields: encounter_id, claim_id, patient external_id,
patient date of birth, patient first name, patient last name,
or encounter external id.
    
</dd>
</dl>

<dl>
<dd>

**external_id:** `String` — Filter to an exact match on encounter external_id, if one exists.
    
</dd>
</dl>

<dl>
<dd>

**diagnoses_updated_since:** `String` — ISO 8601 timestamp; ideally in UTC (although not required): 2019-08-24T14:15:22Z.
    
</dd>
</dl>

<dl>
<dd>

**tag_ids:** `String` — Filter by name of tags on encounters.
    
</dd>
</dl>

<dl>
<dd>

**work_queue_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**billable_status:** `Candid::Encounters::V4::Types::BillableStatusType` — Defines if the Encounter is to be billed by Candid to the responsible_party. Examples for when this should be set to NOT_BILLABLE include if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
    
</dd>
</dl>

<dl>
<dd>

**responsible_party:** `Candid::Encounters::V4::Types::ResponsiblePartyType` — Defines the party to be billed with the initial balance owed on the claim. Use SELF_PAY if you intend to bill self pay/cash pay.
    
</dd>
</dl>

<dl>
<dd>

**owner_of_next_action:** `Candid::Encounters::V4::Types::EncounterOwnerOfNextActionType` — The party who is responsible for taking the next action on an Encounter, as defined by ownership of open Tasks.
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` — The patient ID from the external EMR platform for the patient
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounters.v_4.get(encounter_id) -> Candid::Encounters::V4::Types::Encounter</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounters.v_4.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounters.v_4.create(request) -> Candid::Encounters::V4::Types::Encounter</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounters.v_4.create({
  billing_provider: {
    address: {
      zip_plus_four_code: 'zip_plus_four_code',
      address1: 'address1',
      city: 'city',
      zip_code: 'zip_code'
    },
    tax_id: 'tax_id',
    npi: 'npi'
  },
  diagnoses: [{
    code: 'code'
  }, {
    code: 'code'
  }],
  rendering_provider: {
    npi: 'npi'
  },
  patient: {
    external_id: 'external_id',
    date_of_birth: '2023-01-15',
    address: {
      address1: 'address1',
      city: 'city',
      zip_code: 'zip_code'
    },
    first_name: 'first_name',
    last_name: 'last_name'
  },
  external_id: 'external_id',
  patient_authorized_release: true,
  benefits_assigned_to_provider: true,
  provider_accepts_assignment: true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::Encounters::V4::Types::EncounterCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounters.v_4.create_from_pre_encounter_patient(request) -> Candid::Encounters::V4::Types::Encounter</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an encounter from a pre-encounter patient and appointment. This endpoint is intended to be used by consumers who are managing
patients and appointments in the pre-encounter service and is currently under development. Consumers who are not taking advantage
of the pre-encounter service should use the standard create endpoint.

The endpoint will create an encounter from the provided fields, pulling information from the provided patient and appointment objects
where applicable. In particular, the following fields are populated from the patient and appointment objects:
  - Patient
  - Referring Provider
  - Subscriber Primary
  - Subscriber Secondary
  - Referral Number
  - Responsible Party
  - Guarantor

Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is updated, assuming the
encounter has not already been submitted or adjudicated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounters.v_4.create_from_pre_encounter_patient({
  rendering_provider: {
    npi: 'npi'
  },
  diagnoses: [{
    code: 'code'
  }, {
    code: 'code'
  }],
  pre_encounter_patient_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  pre_encounter_appointment_ids: ['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32', 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'],
  billing_provider: {
    address: {
      zip_plus_four_code: 'zip_plus_four_code',
      address1: 'address1',
      city: 'city',
      zip_code: 'zip_code'
    },
    tax_id: 'tax_id',
    npi: 'npi'
  },
  external_id: 'external_id',
  patient_authorized_release: true,
  benefits_assigned_to_provider: true,
  provider_accepts_assignment: true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::Encounters::V4::Types::EncounterCreateFromPreEncounter` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.encounters.v_4.update(encounter_id, request) -> Candid::Encounters::V4::Types::Encounter</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.encounters.v_4.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::Encounters::V4::Types::EncounterUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ExpectedNetworkStatus V1
<details><summary><code>client.expected_network_status.v_1.compute(request) -> Candid::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Computes the expected network status given the provided information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.expected_network_status.v_1.compute(
  subscriberPayerId: 'subscriber_payer_id',
  subscriberPayerName: 'subscriber_payer_name',
  billingProviderNpi: 'billing_provider_npi',
  billingProviderTin: 'billing_provider_tin',
  renderingProviderNpi: 'rendering_provider_npi',
  contractedState: ,
  dateOfService: 'date_of_service'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**external_patient_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**subscriber_payer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**subscriber_payer_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**subscriber_insurance_type:** `Candid::Commons::Types::InsuranceTypeCode` 
    
</dd>
</dl>

<dl>
<dd>

**subscriber_plan_name:** `String` — The descriptive name of the insurance plan selected by the subscriber, often indicating coverage specifics or tier.
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_npi:** `String` — The National Provider Identifier (NPI) of the healthcare provider responsible for billing. A unique 10-digit identification number.
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_tin:** `String` — Follow the 9-digit format of the Taxpayer Identification Number (TIN).
    
</dd>
</dl>

<dl>
<dd>

**rendering_provider_npi:** `String` — The National Provider Identifier (NPI) of the healthcare provider who delivered the services. A unique 10-digit identification number.
    
</dd>
</dl>

<dl>
<dd>

**contracted_state:** `Candid::Commons::Types::State` — The state in which the healthcare provider has a contractual agreement with the insurance payer.
    
</dd>
</dl>

<dl>
<dd>

**date_of_service:** `String` — Date formatted as YYYY-MM-DD; eg: 2019-08-25.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ExpectedNetworkStatus V2
<details><summary><code>client.expected_network_status.v_2.compute_for_rendering_provider(rendering_provider_id, request) -> Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Computes the expected network status for a given rendering provider.
This endpoint is not available to all customers. Reach out to the Candid sales team
to discuss enabling this endpoint if it is not available for your organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.expected_network_status.v_2.compute_for_rendering_provider({
  subscriber_information: {
    payer_uuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
    member_id: 'member_id',
    insurance_type: {}
  },
  patient_address: {
    address1: 'address1',
    city: 'city',
    zip_code: 'zip_code'
  },
  billing_provider_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  organization_service_facility_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  date_of_service: '2023-01-15'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rendering_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusRequestV2` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.expected_network_status.v_2.compute_all_in_network_providers(request) -> Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Computes all the in network providers for a given set of inputs.
This endpoint is not available to all customers. Reach out to the Candid sales team
to discuss enabling this endpoint if it is not available for your organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.expected_network_status.v_2.compute_all_in_network_providers({
  subscriber_information: {
    payer_uuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
    member_id: 'member_id',
    insurance_type: {}
  },
  patient_address: {
    address1: 'address1',
    city: 'city',
    zip_code: 'zip_code'
  },
  billing_provider_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  organization_service_facility_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  date_of_service: '2023-01-15'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Exports V3
<details><summary><code>client.exports.v_3.get_exports() -> Candid::Exports::V3::Types::GetExportsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

<Warning>
API-based exports are in the process of being deprecated in favor of Candid Data Share and are not being offered to new customers.
Please see the [Candid Data Share docs](https://docs.joincandidhealth.com/introduction/candid-data-share) for more information.
</Warning>

Retrieve CSV-formatted reports on claim submissions and outcomes. This endpoint returns Export objects that contain an
authenticated URL to a customer's reports with a 2min TTL. The schema for the CSV export can be found [here](https://app.joincandidhealth.com/files/exports_schema.csv).

**Schema changes:** Changing column order, removing columns, or changing the name of a column is considered a
[Breaking Change](../../../api-principles/breaking-changes). Adding new columns to the end of the Exports file is not considered a
Breaking Change and happens periodically. For this reason, it is important that any downstream automation or processes built on top
of Candid Health's export files be resilient to the addition of new columns at the end of the file.

**SLA guarantees:** Files for a given date are guaranteed to be available after 3 business days. For example, Friday's file will be
available by Wednesday at the latest. If file generation is still in progress upon request before 3 business days have passed, the
caller will receive a 422 response. If the file has already been generated, it will be served. Historic files should be available
up to 90 days in the past by default. Please email our [Support team](mailto:support@joincandidhealth.com) with any data requests
outside of these stated guarantees.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.exports.v_3.get_exports(
  startDate: '2023-10-01',
  endDate: '2023-10-02'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` 

Beginning date of claim versions returned in the export, ISO 8601 date e.g. 2019-08-24.
Must be at least 1 calendar day in the past. Cannot be earlier than 2022-10-07.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` 

Ending date of claim versions returned in the export, ISO 8601 date; e.g. 2019-08-24.
Must be within 30 days of start_date.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ExternalPaymentAccountConfig V1
<details><summary><code>client.external_payment_account_config.v_1.get_multi() -> Candid::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.external_payment_account_config.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## FeeSchedules V3
<details><summary><code>client.fee_schedules.v_3.get_match(service_line_id) -> Candid::FeeSchedules::V3::Types::MatchResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets the rate that matches a service line.  No result means no rate exists matching the service line's dimensions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.get_match();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.test_match(service_line_id, rate_id) -> Candid::FeeSchedules::V3::Types::MatchTestResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Tests a service line against a rate to see if it matches.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.test_match();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**rate_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.get_multi() -> Candid::FeeSchedules::V3::Types::RatesPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a list of dimensions with their rates. The rates returned will always be the most recent versions of those rates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Max number of dimensions returned. Defaults to 100. Max is 100.
    
</dd>
</dl>

<dl>
<dd>

**active_date:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**organization_billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**states:** `Candid::Commons::Types::State` 
    
</dd>
</dl>

<dl>
<dd>

**zip_codes:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**license_types:** `Candid::OrganizationProviders::V2::Types::LicenseType` 
    
</dd>
</dl>

<dl>
<dd>

**facility_type_codes:** `Candid::Commons::Types::FacilityTypeCode` 
    
</dd>
</dl>

<dl>
<dd>

**network_types:** `Candid::Commons::Types::NetworkType` 
    
</dd>
</dl>

<dl>
<dd>

**payer_plan_group_ids:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cpt_code:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**modifiers:** `Candid::Commons::Types::ProcedureModifier` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.get_unique_values_for_dimension() -> Candid::FeeSchedules::V3::Types::DimensionsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets unique values for a dimension based on other selection criteria. The response is a list of dimensions with your criteria and the unique values populated. This API is useful for driving pivots on dimension values.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.get_unique_values_for_dimension(pivotDimension: );
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Max number of values returned. Defaults to 1000. Max is 1000.
    
</dd>
</dl>

<dl>
<dd>

**pivot_dimension:** `Candid::FeeSchedules::V3::Types::DimensionName` — The name of the dimension to fetch unique values for.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**organization_billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**states:** `Candid::Commons::Types::State` 
    
</dd>
</dl>

<dl>
<dd>

**zip_codes:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**license_types:** `Candid::OrganizationProviders::V2::Types::LicenseType` 
    
</dd>
</dl>

<dl>
<dd>

**facility_type_codes:** `Candid::Commons::Types::FacilityTypeCode` 
    
</dd>
</dl>

<dl>
<dd>

**network_types:** `Candid::Commons::Types::NetworkType` 
    
</dd>
</dl>

<dl>
<dd>

**payer_plan_group_ids:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cpt_code:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**modifiers:** `Candid::Commons::Types::ProcedureModifier` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.get_rate_history(rate_id) -> Internal::Types::Array[Candid::FeeSchedules::V3::Types::Rate]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets every version of a rate.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.get_rate_history();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rate_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.upload_fee_schedule(request) -> Internal::Types::Array[Candid::FeeSchedules::V3::Types::Rate]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a new fee schedule.\n Each rate may either be totally new as qualified by it's dimensions or a new version for an existing rate.\n If adding a new version to an existing rate, the rate must be posted with the next version number (previous version + 1) or a EntityConflictError will be returned.\n Use the dry run flag to discover already existing rates and to run validations.  If validations for any rate fail, no rates will be saved to the system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.upload_fee_schedule(
  dryRun: true,
  rates: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**dry_run:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**rates:** `Internal::Types::Array[Candid::FeeSchedules::V3::Types::RateUpload]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.delete_rate(rate_id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Soft deletes a rate from the system.  Only the most recent version of a rate can be deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.delete_rate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rate_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.get_payer_thresholds_default() -> Candid::FeeSchedules::V3::Types::PayerThreshold</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets the default payer threshold
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.get_payer_thresholds_default();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.get_payer_thresholds() -> Candid::FeeSchedules::V3::Types::PayerThresholdsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a list of payers and thresholds by their uuids
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.get_payer_thresholds(payerUuids: );
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_uuids:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.set_payer_threshold(payer_uuid, request) -> Candid::FeeSchedules::V3::Types::PayerThreshold</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets the threshold information for a payer
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.set_payer_threshold({
  disable_paid_incorrectly: true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::FeeSchedules::V3::Types::PayerThreshold` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.hard_delete_rates(request) -> Integer</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Hard deletes rates from the system that match the provided dimensions.  This is a destructive operation and cannot be undone.  If an empty dimensions object is provided, all rates will be hard deleted.  The maximum number of rates this API will delete at a time is 10000.  Returns the number of rates deleted and if that number is the maximum, the caller should call this API again to continue deleting rates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.hard_delete_rates({
  states: Set.new([]),
  zip_codes: Set.new(['zip_codes']),
  license_types: Set.new([]),
  facility_type_codes: Set.new([]),
  network_types: Set.new([]),
  payer_plan_group_ids: Set.new(['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32']),
  modifiers: Set.new([])
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::FeeSchedules::V3::Types::OptionalDimensions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fee_schedules.v_3.hard_delete_rates_by_ids(request) -> Integer</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Hard deletes specific rates from the system by their IDs. This is a destructive operation and cannot be undone. Limited to 100 rate IDs maximum per request. For bulk deletion of more than 100 rates, use the hard_delete_rates endpoint with dimension filters. Returns the number of rates deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fee_schedules.v_3.hard_delete_rates_by_ids(rateIds: ['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32', 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32']);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rate_ids:** `Internal::Types::Array[String]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Guarantor V1
<details><summary><code>client.guarantor.v_1.create(encounter_id, request) -> Candid::Guarantor::V1::Types::Guarantor</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new guarantor and returns the newly created Guarantor object.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guarantor.v_1.create({
  first_name: 'first_name',
  last_name: 'last_name',
  external_id: 'external_id',
  address: {
    address1: 'address1',
    city: 'city',
    zip_code: 'zip_code'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::Guarantor::V1::Types::GuarantorCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guarantor.v_1.get(guarantor_id) -> Candid::Guarantor::V1::Types::Guarantor</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a guarantor by its `guarantor_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guarantor.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**guarantor_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.guarantor.v_1.update(guarantor_id, request) -> Candid::Guarantor::V1::Types::Guarantor</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a guarantor by its `guarantor_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.guarantor.v_1.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**guarantor_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::Guarantor::V1::Types::GuarantorUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## HealthCareCodeInformation V1
<details><summary><code>client.health_care_code_information.v_1.update(encounter_id, request) -> Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.health_care_code_information.v_1.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.health_care_code_information.v_1.get_all_for_encounter(encounter_id) -> Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.health_care_code_information.v_1.get_all_for_encounter();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**encounter_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ImportInvoice V1
<details><summary><code>client.import_invoice.v_1.import_invoice(request) -> Candid::ImportInvoice::V1::Types::ImportInvoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Import an existing invoice from a third party service to reflect state in Candid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.import_invoice.v_1.import_invoice({
  external_payment_account_config_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  patient_external_id: 'patient_external_id',
  external_customer_identifier: 'external_customer_identifier',
  items: [{
    amount_cents: 1
  }, {
    amount_cents: 1
  }],
  external_identifier: 'external_identifier'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::ImportInvoice::V1::Types::CreateImportInvoiceRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.import_invoice.v_1.get_multi() -> Candid::ImportInvoice::V1::Types::ImportInvoicesPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all Invoices for the authenticated user's organziation with all filters applied.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.import_invoice.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**encounter_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**note:** `String` — partial match supported
    
</dd>
</dl>

<dl>
<dd>

**due_date_before:** `String` — all invoices whose due date is before this due date, not inclusive
    
</dd>
</dl>

<dl>
<dd>

**due_date_after:** `String` — all invoices whose due date is after this due date, not inclusive
    
</dd>
</dl>

<dl>
<dd>

**status:** `Candid::Invoices::V2::Types::InvoiceStatus` — all invoices that match any of the provided statuses
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::Invoices::V2::Types::InvoiceSortField` — Defaults to created_at
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.import_invoice.v_1.get(invoice_id) -> Candid::ImportInvoice::V1::Types::ImportInvoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve and view an import invoice
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.import_invoice.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoice_id:** `String` — InvoiceId to be returned
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.import_invoice.v_1.update(invoice_id, request) -> Candid::ImportInvoice::V1::Types::ImportInvoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the information on the imported invoice
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.import_invoice.v_1.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoice_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## InsuranceAdjudications V1
<details><summary><code>client.insurance_adjudications.v_1.get(insurance_adjudication_id) -> Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created insurance adjudication by its `insurance_adjudication_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_adjudications.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**insurance_adjudication_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_adjudications.v_1.create(request) -> Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudication</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new insurance adjudication record and returns the newly created InsuranceAdjudication object.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_adjudications.v_1.create({
  payee: {
    payee_name: 'payee_name'
  },
  check_date: '2023-01-15',
  claims: {
    'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32': [{
      service_lines: {
        'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32': [{
          carcs: [{
            amount_cents: 1
          }, {
            amount_cents: 1
          }],
          rarcs: [{}, {}]
        }, {
          carcs: [{
            amount_cents: 1
          }, {
            amount_cents: 1
          }],
          rarcs: [{}, {}]
        }]
      },
      carcs: [{
        amount_cents: 1
      }, {
        amount_cents: 1
      }]
    }, {
      service_lines: {
        'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32': [{
          carcs: [{
            amount_cents: 1
          }, {
            amount_cents: 1
          }],
          rarcs: [{}, {}]
        }, {
          carcs: [{
            amount_cents: 1
          }, {
            amount_cents: 1
          }],
          rarcs: [{}, {}]
        }]
      },
      carcs: [{
        amount_cents: 1
      }, {
        amount_cents: 1
      }]
    }]
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::InsuranceAdjudications::V1::Types::InsuranceAdjudicationCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_adjudications.v_1.delete(insurance_adjudication_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the insurance adjudication record matching the provided insurance_adjudication_id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_adjudications.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**insurance_adjudication_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## InsurancePayments V1
<details><summary><code>client.insurance_payments.v_1.get_multi() -> Candid::InsurancePayments::V1::Types::InsurancePaymentsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all non-ERA originated insurance payments satisfying the search criteria
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_payments.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**claim_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::InsurancePayments::V1::Types::InsurancePaymentSortField` — Defaults to payment_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_payments.v_1.get(insurance_payment_id) -> Candid::InsurancePayments::V1::Types::InsurancePayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created insurance payment by its `insurance_payment_id`.
If the payment does not exist, a `403` will be thrown.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_payments.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**insurance_payment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## InsuranceRefunds V1
<details><summary><code>client.insurance_refunds.v_1.get_multi() -> Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all insurance refunds satisfying the search criteria AND whose organization_id matches
the current organization_id of the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_refunds.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**claim_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::InsuranceRefunds::V1::Types::InsuranceRefundSortField` — Defaults to refund_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_refunds.v_1.get(insurance_refund_id) -> Candid::InsuranceRefunds::V1::Types::InsuranceRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created insurance refund by its `insurance_refund_id`.
If the refund does not exist, a `403` will be thrown.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_refunds.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**insurance_refund_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_refunds.v_1.create(request) -> Candid::InsuranceRefunds::V1::Types::InsuranceRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new insurance refund record and returns the newly created `InsuranceRefund` object.
The allocations can describe whether the refund is being applied toward a specific service line,
claim, or billing provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_refunds.v_1.create({
  amount_cents: 1,
  allocations: [{
    amount_cents: 1
  }, {
    amount_cents: 1
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::InsuranceRefunds::V1::Types::InsuranceRefundCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_refunds.v_1.update(insurance_refund_id, request) -> Candid::InsuranceRefunds::V1::Types::InsuranceRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the patient refund record matching the provided insurance_refund_id. If updating the refund amount,
then the allocations must be appropriately updated as well.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_refunds.v_1.update(insuranceRefundId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**insurance_refund_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_note:** `Candid::Financials::Types::NoteUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**refund_reason:** `Candid::Financials::Types::RefundReasonUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.insurance_refunds.v_1.delete(insurance_refund_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the insurance refund record matching the provided `insurance_refund_id`.
If the matching record's organization_id does not match the authenticated user's
current organization_id, then a response code of `403` will be returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.insurance_refunds.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**insurance_refund_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## MedicationDispense V1
<details><summary><code>client.medication_dispense.v_1.create(request) -> Candid::Encounters::V4::Types::Encounter</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.medication_dispense.v_1.create({
  medication_dispense_external_id: 'medication_dispense_external_id',
  patient_external_id: 'patient_external_id',
  procedure_code: 'procedure_code',
  quantity: 'quantity',
  date_of_service: '2023-01-15'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::MedicationDispense::V1::Types::MedicationDispenseCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## NonInsurancePayerPayments V1
<details><summary><code>client.non_insurance_payer_payments.v_1.get_multi() -> Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all non-insurance payer payments
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_payments.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**non_insurance_payer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**check_number:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**invoice_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentSortField` — Defaults to refund_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_payments.v_1.get(non_insurance_payer_payment_id) -> Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created non-insurance payer payment by its `non_insurance_payer_payment_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_payments.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_payment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_payments.v_1.create(request) -> Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_payments.v_1.create({
  non_insurance_payer_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  amount_cents: 1,
  allocations: [{
    amount_cents: 1
  }, {
    amount_cents: 1
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_payments.v_1.update(non_insurance_payer_payment_id, request) -> Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_payments.v_1.update(nonInsurancePayerPaymentId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_payment_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payment_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payment_note:** `Candid::Financials::Types::NoteUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**invoice_id:** `Candid::Financials::Types::InvoiceUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_payments.v_1.delete(non_insurance_payer_payment_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the non-insurance payer payment record matching the provided `non_insurance_payer_payment_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_payments.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_payment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## NonInsurancePayerRefunds V1
<details><summary><code>client.non_insurance_payer_refunds.v_1.get_multi() -> Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all non-insurance payer refunds satisfying the search criteria
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_refunds.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**non_insurance_payer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**check_number:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**invoice_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundSortField` — Defaults to refund_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_refunds.v_1.get(non_insurance_payer_refund_id) -> Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created non-insurance payer refund by its `non_insurance_payer_refund_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_refunds.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_refund_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_refunds.v_1.create(request) -> Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new non-insurance payer refund record and returns the newly created `NonInsurancePayerRefund` object.
The allocations can describe whether the refund is being applied toward a specific service line,
claim, or billing provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_refunds.v_1.create({
  non_insurance_payer_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  amount_cents: 1,
  allocations: [{
    amount_cents: 1
  }, {
    amount_cents: 1
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_refunds.v_1.update(non_insurance_payer_refund_id, request) -> Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the non-insurance payer refund record matching the provided non_insurance_payer_refund_id. If updating the refund amount,
then the allocations must be appropriately updated as well.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_refunds.v_1.update(nonInsurancePayerRefundId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_refund_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_note:** `Candid::Financials::Types::NoteUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**refund_reason:** `Candid::Financials::Types::RefundReasonUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**invoice_id:** `Candid::Financials::Types::InvoiceUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payer_refunds.v_1.delete(non_insurance_payer_refund_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the non-insurance payer refund record matching the provided `non_insurance_payer_refund_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payer_refunds.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_refund_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## NonInsurancePayers V1
<details><summary><code>client.non_insurance_payers.v_1.create(request) -> Candid::NonInsurancePayers::V1::Types::NonInsurancePayer</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.create({
  name: 'name'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::NonInsurancePayers::V1::Types::CreateNonInsurancePayerRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payers.v_1.toggle_enablement(non_insurance_payer_id, request) -> Candid::NonInsurancePayers::V1::Types::NonInsurancePayer</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.toggle_enablement({
  enabled: true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::NonInsurancePayers::V1::Types::ToggleNonInsurancePayerEnablementRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payers.v_1.get_multi() -> Candid::NonInsurancePayers::V1::Types::NonInsurancePayerPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**category:** `String` — Fuzzy-match category names of non-insurance payers.
    
</dd>
</dl>

<dl>
<dd>

**categories_exact:** `String` 

Filter by one or more categories by name.
When multiple are present, non-insurance payers with any of the specified
categories will be matched.
    
</dd>
</dl>

<dl>
<dd>

**clinical_trial_ids:** `String` 

Filter by one or more clinical trials by their `clinical_trial_id`.
When multiple are present, non-insurance payers with any of the specified
clinical trials will be matched.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::NonInsurancePayers::V1::Types::NonInsurancePayerSortField` 
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payers.v_1.get_categories() -> Candid::NonInsurancePayers::V1::Types::NonInsurancePayerCategoriesPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of all non-insurance payer categories.

Non-insurance payer categories are simply strings and are not stored as a
separate object in Candid. They are created when added to at least one
non-insurance payer's `category` field and are deleted when there are no
longer any non-insurance payers that contain them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.get_categories();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**search_term:** `String` — Filters categories by fuzzy matching on name.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limits the maximum number of categories that will be returned. Defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` — The page token to continue paging through a previous request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payers.v_1.get(non_insurance_payer_id) -> Candid::NonInsurancePayers::V1::Types::NonInsurancePayer</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payers.v_1.update(non_insurance_payer_id, request) -> Candid::NonInsurancePayers::V1::Types::NonInsurancePayer</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.non_insurance_payers.v_1.delete(non_insurance_payer_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.non_insurance_payers.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**non_insurance_payer_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## OrganizationProviders V3
<details><summary><code>client.organization_providers.v_3.get(organization_provider_id) -> Candid::OrganizationProviders::V3::Types::OrganizationProviderV2</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_providers.v_3.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**organization_provider_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_providers.v_3.get_multi() -> Candid::OrganizationProviders::V3::Types::OrganizationProviderPageV2</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_providers.v_3.get_multi(
  limit: 100,
  searchTerm: 'john',
  npi: '1234567890',
  isRendering: true,
  isBilling: true,
  pageToken: 'eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9',
  sort: 
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Limit the number of results returned. Defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**search_term:** `String` — Filter to a name or a part of a name.
    
</dd>
</dl>

<dl>
<dd>

**npi:** `String` — Filter to a specific NPI.
    
</dd>
</dl>

<dl>
<dd>

**is_rendering:** `Internal::Types::Boolean` — Filter to only rendering providers.
    
</dd>
</dl>

<dl>
<dd>

**is_billing:** `Internal::Types::Boolean` — Filter to only billing providers.
    
</dd>
</dl>

<dl>
<dd>

**organization_provider_ids:** `String` — Filter to the provided organization provider IDs.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` — The page token to continue paging through a previous request.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::OrganizationProviders::V2::Types::OrganizationProviderSortOptions` — Defaults to PROVIDER_NAME_ASC.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_providers.v_3.create(request) -> Candid::OrganizationProviders::V3::Types::OrganizationProviderV2</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_providers.v_3.create({
  npi: 'npi',
  is_rendering: true,
  is_billing: true,
  qualifications: [{}, {}]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::OrganizationProviders::V3::Types::OrganizationProviderCreateV2` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_providers.v_3.update(organization_provider_id, request) -> Candid::OrganizationProviders::V3::Types::OrganizationProviderV2</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_providers.v_3.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**organization_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::OrganizationProviders::V3::Types::OrganizationProviderUpdateV2` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## OrganizationServiceFacilities V2
<details><summary><code>client.organization_service_facilities.v_2.get(organization_service_facility_id) -> Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_service_facilities.v_2.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**organization_service_facility_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_service_facilities.v_2.get_multi() -> Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_service_facilities.v_2.get_multi(
  limit: 100,
  name: 'Test Service Facility',
  pageToken: 'eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Limit the number of results returned. Defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Filter to a name or a part of a name.
    
</dd>
</dl>

<dl>
<dd>

**organization_service_facility_ids:** `String` — Filter to the provided organization service facility IDs.
    
</dd>
</dl>

<dl>
<dd>

**external_ids:** `String` — Filter by one or more external_ids.
    
</dd>
</dl>

<dl>
<dd>

**place_of_service_code:** `Candid::Commons::Types::FacilityTypeCode` — Filter by Place of Service (POS) code.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` — The page token to continue paging through a previous request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_service_facilities.v_2.get_by_external_id(external_id) -> Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Looks up a single organization service facility by its `external_id` field. This can be useful
for finding service facilities within Candid which are associated with service facilities in
an external system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_service_facilities.v_2.get_by_external_id();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**external_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_service_facilities.v_2.create(request) -> Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_service_facilities.v_2.create({
  name: 'Test Service Facility',
  aliases: ['Test Service Facility Alias'],
  description: 'Test Service Facility Description',
  telecoms: ['555-555-5555'],
  address: {
    address1: '123 Main St',
    address2: 'Apt 1',
    city: 'New York',
    zip_code: '10001',
    zip_plus_four_code: '1234'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_service_facilities.v_2.update(organization_service_facility_id, request) -> Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_service_facilities.v_2.update({
  name: 'Test Service Facility',
  aliases: ['Test Service Facility Alias'],
  description: 'Test Service Facility Description',
  telecoms: ['555-555-5555'],
  address: {
    address1: '123 Main St',
    address2: 'Apt 1',
    city: 'New York',
    zip_code: '10001',
    zip_plus_four_code: '1234'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**organization_service_facility_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacilityUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.organization_service_facilities.v_2.delete(organization_service_facility_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.organization_service_facilities.v_2.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**organization_service_facility_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PatientAr V1
<details><summary><code>client.patient_ar.v_1.list_inventory() -> Candid::PatientAr::V1::Types::ListInventoryPagedResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

NOTE: This service is in-development and can only be used by select partners. Please contact Candid Health to request access.

Retrieve a list of inventory records based on the provided filters. Each inventory record provides the latest invoiceable status of the associated claim.
The response is paginated, and the `page_token` can be used to retrieve subsequent pages. Initial requests should not include `page_token`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_ar.v_1.list_inventory();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**since:** `String` — Timestamp to filter records since, inclusive
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Maximum number of records to return, default is 100
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_ar.v_1.itemize(claim_id) -> Candid::PatientAr::V1::Types::InvoiceItemizationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

NOTE: This service is in-development and can only be used by select partners. Please contact Candid Health to request access.

Provides detailed itemization of invoice data for a specific claim.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_ar.v_1.itemize();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**claim_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PatientPayments V4
<details><summary><code>client.patient_payments.v_4.get_multi() -> Candid::PatientPayments::V4::Types::PatientPaymentsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all patient payments satisfying the search criteria AND whose organization_id matches
the current organization_id of the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_payments.v_4.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**claim_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**unattributed:** `Internal::Types::Boolean` — returns payments with unattributed allocations if set to true
    
</dd>
</dl>

<dl>
<dd>

**invoice_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sources:** `Candid::Financials::Types::PatientTransactionSource` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::PatientPayments::V4::Types::PatientPaymentSortField` — Defaults to payment_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_payments.v_4.get(patient_payment_id) -> Candid::PatientPayments::V4::Types::PatientPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created patient payment by its `patient_payment_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_payments.v_4.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_payment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_payments.v_4.create(request) -> Candid::PatientPayments::V4::Types::PatientPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new patient payment record and returns the newly created PatientPayment object.
The allocations can describe whether the payment is being applied toward a specific service line,
claim, or billing provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_payments.v_4.create(
  amountCents: 1,
  patientExternalId: 'patient_external_id',
  allocations: [{
    amount_cents: 1
  }, {
    amount_cents: 1
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**amount_cents:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**payment_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payment_note:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**allocations:** `Internal::Types::Array[Candid::Financials::Types::AllocationCreate]` 
    
</dd>
</dl>

<dl>
<dd>

**invoice:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_payments.v_4.update(patient_payment_id, request) -> Candid::PatientPayments::V4::Types::PatientPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the patient payment record matching the provided patient_payment_id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_payments.v_4.update(patientPaymentId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_payment_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payment_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payment_note:** `Candid::Financials::Types::NoteUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**invoice:** `Candid::Financials::Types::InvoiceUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_payments.v_4.delete(patient_payment_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the patient payment record matching the provided patient_payment_id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_payments.v_4.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_payment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PatientRefunds V1
<details><summary><code>client.patient_refunds.v_1.get_multi() -> Candid::PatientRefunds::V1::Types::PatientRefundsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all patient refunds satisfying the search criteria AND whose organization_id matches
the current organization_id of the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_refunds.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**claim_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**unattributed:** `Internal::Types::Boolean` — returns payments with unattributed allocations if set to true
    
</dd>
</dl>

<dl>
<dd>

**invoice_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sources:** `Candid::Financials::Types::PatientTransactionSource` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::PatientRefunds::V1::Types::PatientRefundSortField` — Defaults to refund_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_refunds.v_1.get(patient_refund_id) -> Candid::PatientRefunds::V1::Types::PatientRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created patient refund by its `patient_refund_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_refunds.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_refund_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_refunds.v_1.create(request) -> Candid::PatientRefunds::V1::Types::PatientRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new patient refund record and returns the newly created PatientRefund object.
The allocations can describe whether the refund is being applied toward a specific service line,
claim, or billing provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_refunds.v_1.create(
  amountCents: 1,
  patientExternalId: 'patient_external_id',
  allocations: [{
    amount_cents: 1
  }, {
    amount_cents: 1
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**amount_cents:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**refund_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_note:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**allocations:** `Internal::Types::Array[Candid::Financials::Types::AllocationCreate]` 
    
</dd>
</dl>

<dl>
<dd>

**invoice:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_reason:** `Candid::Financials::Types::RefundReason` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_refunds.v_1.update(patient_refund_id, request) -> Candid::PatientRefunds::V1::Types::PatientRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the patient refund record matching the provided patient_refund_id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_refunds.v_1.update(patientRefundId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_refund_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_timestamp:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refund_note:** `Candid::Financials::Types::NoteUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**invoice:** `Candid::Financials::Types::InvoiceUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**refund_reason:** `Candid::Financials::Types::RefundReasonUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patient_refunds.v_1.delete(patient_refund_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the patient refund record matching the provided patient_refund_id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patient_refunds.v_1.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_refund_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayerPlanGroups V1
<details><summary><code>client.payer_plan_groups.v_1.get_multi() -> Candid::PayerPlanGroups::V1::Types::PayerPlanGroupPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all payer plan groups matching filter criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payer_plan_groups.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**plan_group_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**plan_type:** `Candid::Commons::Types::SourceOfPaymentCode` 
    
</dd>
</dl>

<dl>
<dd>

**is_active:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**payer_plan_group_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. Cannot exc
    
</dd>
</dl>

<dl>
<dd>

**sort_by_similarity:** `String` 

If this property is passed, the results will be ordered by those that contain a payer_id, payer_name, plan_group_name, or
payer_address most similar to the value passed. This will take precedence over the sort and sort_direction properties. This
will always sort in order of most similar to least similar.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::PayerPlanGroups::V1::Types::PayerPlanGroupSortField` — Defaults to plan_group_name. If sort_by_similarity is passed, that sort will takes precedence over this property.
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to ascending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payer_plan_groups.v_1.get(payer_plan_group_id) -> Candid::PayerPlanGroups::V1::Types::PayerPlanGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Return a plan group with a given ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payer_plan_groups.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_plan_group_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payer_plan_groups.v_1.create(request) -> Candid::PayerPlanGroups::V1::Types::PayerPlanGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a payer plan group
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payer_plan_groups.v_1.create({
  plan_group_name: 'plan_group_name',
  payer_uuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payer_plan_groups.v_1.update(payer_plan_group_id, request) -> Candid::PayerPlanGroups::V1::Types::PayerPlanGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update any of the fields on a payer plan group
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payer_plan_groups.v_1.update({
  plan_group_name: 'plan_group_name',
  payer_uuid: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_plan_group_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PayerPlanGroups::V1::Types::MutablePayerPlanGroup` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payer_plan_groups.v_1.deactivate(payer_plan_group_id) -> Candid::PayerPlanGroups::V1::Types::PayerPlanGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Marks the payer plan group as deactivated
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payer_plan_groups.v_1.deactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_plan_group_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payers V3
<details><summary><code>client.payers.v_3.get(payer_uuid) -> Candid::Payers::V3::Types::Payer</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payers.v_3.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payers.v_3.get_all() -> Candid::Payers::V3::Types::PayerPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payers.v_3.get_all(
  limit: 100,
  searchTerm: 'john',
  pageToken: 'eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**search_term:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payers V4
<details><summary><code>client.payers.v_4.get(payer_uuid) -> Candid::Payers::V4::Types::Payer</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payers.v_4.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payers.v_4.get_all() -> Candid::Payers::V4::Types::PayerPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payers.v_4.get_all();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Maximum number of entities per page, defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**search_term:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ServiceLines V2
<details><summary><code>client.service_lines.v_2.create(request) -> Candid::ServiceLines::V2::Types::ServiceLine</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.service_lines.v_2.create({
  procedure_code: 'procedure_code',
  quantity: 'quantity',
  claim_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::ServiceLines::V2::Types::ServiceLineCreateStandalone` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.service_lines.v_2.create_universal(request) -> Candid::ServiceLines::V2::Types::ServiceLine</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.service_lines.v_2.create_universal({
  quantity: 'quantity',
  claim_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::ServiceLines::V2::Types::UniversalServiceLineCreateStandalone` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.service_lines.v_2.update_universal(service_line_id, request) -> Candid::ServiceLines::V2::Types::ServiceLine</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.service_lines.v_2.update_universal({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::ServiceLines::V2::Types::UniversalServiceLineUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.service_lines.v_2.update(service_line_id, request) -> Candid::ServiceLines::V2::Types::ServiceLine</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.service_lines.v_2.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::ServiceLines::V2::Types::ServiceLineUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.service_lines.v_2.delete(service_line_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.service_lines.v_2.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Superbills V1
<details><summary><code>client.superbills.v_1.create_superbill(request) -> Candid::Superbills::V1::Types::SuperbillResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.superbills.v_1.create_superbill(
  patientExternalId: 'patient_external_id',
  dateRangeMin: '2023-01-15',
  dateRangeMax: '2023-01-15'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_external_id:** `String` — Empty string not allowed
    
</dd>
</dl>

<dl>
<dd>

**date_range_min:** `String` — Minimum (inclusive) date selected for the superbill
    
</dd>
</dl>

<dl>
<dd>

**date_range_max:** `String` — Maximum (inclusive) date selected for the superbill
    
</dd>
</dl>

<dl>
<dd>

**pay_to_address:** `Candid::Commons::Types::StreetAddressShortZip` — Address that will be displayed on the superbill as the 'Pay to' Address. If not provided this value will be set from available encounter data.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tasks V3
<details><summary><code>client.tasks.v_3.get_actions(task_id) -> Candid::Tasks::V3::Types::TaskActions</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tasks.v_3.get_actions();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**task_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tasks.v_3.get_multi() -> Candid::Tasks::V3::Types::TaskPage</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tasks.v_3.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Candid::Tasks::Commons::Types::TaskStatus` 
    
</dd>
</dl>

<dl>
<dd>

**task_type:** `Candid::Tasks::Commons::Types::TaskType` 
    
</dd>
</dl>

<dl>
<dd>

**categories:** `String` — Only return tasks with categories that match one in this comma-separated list.
    
</dd>
</dl>

<dl>
<dd>

**updated_since:** `String` — Only return tasks updated on or after this date-time
    
</dd>
</dl>

<dl>
<dd>

**encounter_id:** `String` — Only return tasks associated with this encounter
    
</dd>
</dl>

<dl>
<dd>

**search_term:** `String` — Query tasks by encounter_id, claim_id, task_id, or external_id
    
</dd>
</dl>

<dl>
<dd>

**assigned_to_id:** `String` — Only return tasks assigned to this user
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_min:** `String` — The minimum date of service for the linked encounter
    
</dd>
</dl>

<dl>
<dd>

**date_of_service_max:** `String` — The maximum date of service for the linked encounter
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_npi:** `String` — The NPI of the billing provider associated with the task's claim
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::Tasks::V3::Types::TaskSortOptions` — Defaults to updated_at:desc
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tasks.v_3.get(task_id) -> Candid::Tasks::V3::Types::Task</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tasks.v_3.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**task_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tasks.v_3.create(request) -> Candid::Tasks::V3::Types::Task</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tasks.v_3.create({
  encounter_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  description: 'description',
  work_queue_id: 'work_queue_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::Tasks::V3::Types::TaskCreateV3` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tasks.v_3.update(task_id, request) -> Candid::Tasks::V3::Types::Task</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tasks.v_3.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**task_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::Tasks::V3::Types::TaskUpdateV3` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## WriteOffs V1
<details><summary><code>client.write_offs.v_1.get_multi() -> Candid::WriteOffs::V1::Types::WriteOffsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all write-offs satisfying the search criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.write_offs.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100. The value must be greater than 0 and less than 1000.
    
</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_line_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**claim_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**billing_provider_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Candid::WriteOffs::V1::Types::WriteOffSortField` — Defaults to write_off_timestamp
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::Commons::Types::SortDirection` — Sort direction. Defaults to descending order if not provided.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_types:** `Candid::Financials::Types::AccountType` — Filters the returned values to include only the provided account types.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.write_offs.v_1.get(write_off_id) -> Candid::WriteOffs::V1::Types::WriteOff</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a previously created write off by its `write_off_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.write_offs.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**write_off_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.write_offs.v_1.create(request) -> Candid::WriteOffs::V1::Types::CreateWriteOffsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates one or many write-offs applied toward a specific service line,
claim, or billing provider.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.write_offs.v_1.create(writeOffs: []);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**write_offs:** `Internal::Types::Array[Candid::WriteOffs::V1::Types::WriteOffCreate]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.write_offs.v_1.revert(write_off_id) -> Candid::WriteOffs::V1::Types::WriteOff</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reverts a write off given a `write_off_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.write_offs.v_1.revert();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**write_off_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.write_offs.v_1.revert_insurance_balance_adjustment(adjustment_id) -> Candid::WriteOffs::V1::Types::WriteOff</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reverts an Insurance Balance Adjustment given an `adjustment_id`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.write_offs.v_1.revert_insurance_balance_adjustment();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**adjustment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.write_offs.v_1.revert_era_originated_insurance_balance_adjustment(adjustment_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reverts an ERA-originated Insurance Balance Adjustment given an `adjustment_id`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.write_offs.v_1.revert_era_originated_insurance_balance_adjustment();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**adjustment_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Appointments V1
<details><summary><code>client.pre_encounter.appointments.v_1.create(request) -> Candid::PreEncounter::Appointments::V1::Types::Appointment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds an appointment.  VersionConflictError is returned when the placer_appointment_id is already in use.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.create({
  patient_id: 'patient_id',
  start_timestamp: '2024-01-15T09:30:00Z',
  service_duration: 1,
  services: [{}, {}]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::Appointments::V1::Types::MutableAppointment` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.appointments.v_1.get_visits() -> Candid::PreEncounter::Appointments::V1::Types::VisitsPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets all Visits within a given time range. The return list is ordered by start_time ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.get_visits();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**sort_field:** `String` — Defaults to appointment.start_time.
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::PreEncounter::Common::Types::SortDirection` — Defaults to ascending.
    
</dd>
</dl>

<dl>
<dd>

**filters:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.appointments.v_1.get(id) -> Candid::PreEncounter::Appointments::V1::Types::Appointment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets an appointment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.appointments.v_1.get_history(id) -> Internal::Types::Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets an appointment along with it's full history.  The return list is ordered by version ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.get_history();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.appointments.v_1.update(id, version, request) -> Candid::PreEncounter::Appointments::V1::Types::Appointment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an appointment. The path must contain the next version number to prevent race conditions. For example, if the current version of the appointment is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the appointment. Updating historic versions is not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.update({
  patient_id: 'patient_id',
  start_timestamp: '2024-01-15T09:30:00Z',
  service_duration: 1,
  services: [{}, {}]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Appointments::V1::Types::MutableAppointment` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.appointments.v_1.scan() -> Internal::Types::Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Scans up to 100 appointment updates.  The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.scan(since: '2024-01-15T09:30:00Z');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**since:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.appointments.v_1.deactivate(id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets an appointment as deactivated.  The path must contain the most recent version to prevent race conditions.  Deactivating historic versions is not supported. Subsequent updates via PUT to the appointment will "reactivate" the appointment and set the deactivated flag to false.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.appointments.v_1.deactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Coverages V1
<details><summary><code>client.pre_encounter.coverages.v_1.create(request) -> Candid::PreEncounter::Coverages::V1::Types::Coverage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new Coverage. A Coverage provides the high-level identifiers and descriptors of a specific insurance plan for a specific individual - typically the information you can find on an insurance card. Additionally a coverage will include detailed benefits information covered by the specific plan for the individual.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.create({
  subscriber: {
    name: {
      family: 'family',
      given: ['given', 'given']
    }
  },
  patient: 'patient',
  insurance_plan: {
    member_id: 'member_id',
    payer_id: 'payer_id',
    payer_name: 'payer_name'
  },
  verified: true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::Coverages::V1::Types::MutableCoverage` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.update(id, version, request) -> Candid::PreEncounter::Coverages::V1::Types::Coverage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a Coverage. The path must contain the next version number to prevent race conditions. For example, if the current version of the coverage is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the coverage. Updating historic versions is not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.update({
  subscriber: {
    name: {
      family: 'family',
      given: ['given', 'given']
    }
  },
  patient: 'patient',
  insurance_plan: {
    member_id: 'member_id',
    payer_id: 'payer_id',
    payer_name: 'payer_name'
  },
  verified: true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Coverages::V1::Types::MutableCoverage` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.get_multi_paginated() -> Candid::PreEncounter::Coverages::V1::Types::CoveragesPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a page of Coverages based on the search criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.get_multi_paginated();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payer_plan_group_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Must be between 0 and 1000. Defaults to 100
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.get(id) -> Candid::PreEncounter::Coverages::V1::Types::Coverage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

gets a specific Coverage
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.get_history(id) -> Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a coverage along with it's full history.  The return list is ordered by version ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.get_history();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.get_multi() -> Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of Coverages based on the search criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.scan() -> Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::Coverage]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Scans up to 100 coverage updates. The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.

**Polling Pattern:**
To continuously poll for updates without gaps:
1. Make your initial request with a `since` timestamp (e.g., `since=2020-01-01T13:00:00.000Z`)
2. The API returns up to 100 coverage records, sorted by `updated_at` ascending
3. Find the `updated_at` value from the last record in the response
4. Use that `updated_at` value as the `since` parameter in your next request
5. Repeat steps 2-4 to ingest updates until you receive an empty list

**Important Notes:**
- The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you can deduplicate by ID and version)
- All coverage records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for tracking changes
- Timestamps have millisecond resolution for precise ordering
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.scan(since: '2024-01-15T09:30:00Z');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**since:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.batch_update_ppg(ppg_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Finds all coverages associated with the given ppg_id and updates the ppg_fields for each coverage.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.batch_update_ppg({
  payer_plan_group_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  payer_id: 'payer_id',
  payer_name: 'payer_name'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ppg_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.check_eligibility(id, request) -> Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Initiates an eligibility check. Returns the metadata of the check if successfully initiated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.check_eligibility(
  id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  serviceCode: ,
  dateOfService: '2023-01-15',
  npi: 'npi'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_code:** `Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode` 
    
</dd>
</dl>

<dl>
<dd>

**date_of_service:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**npi:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.coverages.v_1.get_eligibility(id, check_id) -> Candid::PreEncounter::Coverages::V1::Types::CoverageEligibilityCheckResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets the eligibility of a patient for a specific coverage if successful.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.coverages.v_1.get_eligibility();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**check_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter EligibilityChecks V1
<details><summary><code>client.pre_encounter.eligibility_checks.v_1.post(request) -> Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends real-time eligibility checks to payers through Stedi.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.eligibility_checks.v_1.post({
  payer_id: 'payer_id',
  subscriber: {
    first_name: 'first_name',
    last_name: 'last_name'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.eligibility_checks.v_1.batch(request) -> Candid::PreEncounter::EligibilityChecks::V1::Types::BatchEligibilityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends a batch of eligibility checks to payers through Stedi.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.eligibility_checks.v_1.batch();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.eligibility_checks.v_1.poll_batch(batch_id) -> Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Polls the status of a batch eligibility check.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.eligibility_checks.v_1.poll_batch(batchId: 'batch_id');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**batch_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.eligibility_checks.v_1.payer_search() -> Candid::PreEncounter::EligibilityChecks::V1::Types::PayerSearchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for payers that match the query parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.eligibility_checks.v_1.payer_search();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page_size:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.eligibility_checks.v_1.recommendation() -> Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets recommendation for eligibility checks based on the request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.eligibility_checks.v_1.recommendation();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**filters:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.eligibility_checks.v_1.create_recommendation(request) -> Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an eligibiilty recommendation based on the request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.eligibility_checks.v_1.create_recommendation({
  eligibility_check_id: 'eligibility_check_id',
  patient: {}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Images V1
<details><summary><code>client.pre_encounter.images.v_1.create(request) -> Candid::PreEncounter::Images::V1::Types::Image</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds an image.  VersionConflictError is returned if a front or back of this coverage already exists.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.images.v_1.create({
  file_name: 'file_name',
  display_name: 'display_name',
  file_type: 'file_type'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::Images::V1::Types::MutableImage` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.images.v_1.get(id) -> Candid::PreEncounter::Images::V1::Types::Image</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets an image by imageId.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.images.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.images.v_1.update(id, version, request) -> Candid::PreEncounter::Images::V1::Types::Image</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an Image.  The path must contain the most recent version to prevent races.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.images.v_1.update({
  file_name: 'file_name',
  display_name: 'display_name',
  file_type: 'file_type'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Images::V1::Types::MutableImage` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.images.v_1.deactivate(id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets an Image as deactivated.  The path must contain the most recent version to prevent races.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.images.v_1.deactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.images.v_1.get_multi() -> Internal::Types::Array[Candid::PreEncounter::Images::V1::Types::Image]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for images that match the query parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.images.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**patient_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**coverage_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Lists V1
<details><summary><code>client.pre_encounter.lists.v_1.get_patient_list() -> Candid::PreEncounter::Lists::V1::Types::PatientListPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets patients with dependent objects for patients that match the query parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.lists.v_1.get_patient_list();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**sort_field:** `String` — Defaults to patient.updatedAt.
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::PreEncounter::Common::Types::SortDirection` — Defaults to ascending.
    
</dd>
</dl>

<dl>
<dd>

**filters:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.lists.v_1.get_appointment_list() -> Candid::PreEncounter::Lists::V1::Types::AppointmentListPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for appointments that match the query parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.lists.v_1.get_appointment_list();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sort_field:** `String` — Defaults to appointment.startTimestamp.
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::PreEncounter::Common::Types::SortDirection` — Defaults to asc.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Defaults to 100.
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**filters:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Notes V1
<details><summary><code>client.pre_encounter.notes.v_1.get(id) -> Candid::PreEncounter::Notes::V1::Types::Note</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a note by NoteId.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.notes.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.notes.v_1.create(request) -> Candid::PreEncounter::Notes::V1::Types::Note</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a new note.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.notes.v_1.create({
  value: 'value'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::Notes::V1::Types::MutableNote` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.notes.v_1.update(id, version, request) -> Candid::PreEncounter::Notes::V1::Types::Note</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a note. The path must contain the most recent version to prevent races.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.notes.v_1.update({
  value: 'value'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Notes::V1::Types::MutableNote` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.notes.v_1.deactivate(id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets a note as deactivated.  The path must contain the most recent version to prevent races.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.notes.v_1.deactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Patients V1
<details><summary><code>client.pre_encounter.patients.v_1.create(request) -> Candid::PreEncounter::Patients::V1::Types::Patient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a patient.  VersionConflictError is returned when the patient's external ID is already in use.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.create();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**skip_duplicate_check:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Patients::V1::Types::MutablePatient` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.create_with_mrn(request) -> Candid::PreEncounter::Patients::V1::Types::Patient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a patient and hydrates their MRN with a pre-existing MRN.  Once this patient is created their MRN will not be editable. BadRequestError is returned when the MRN is greater than 20 characters. VersionConflictError is returned when the patient's external ID is already in use.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.create_with_mrn();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**skip_duplicate_check:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.get_multi() -> Candid::PreEncounter::Patients::V1::Types::PatientPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for patients that match the query parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.get_multi();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**mrn:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort_field:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sort_direction:** `Candid::PreEncounter::Common::Types::SortDirection` — Defaults to ascending.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.search_providers() -> Internal::Types::Array[Candid::PreEncounter::Common::Types::ExternalProvider]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for referring providers that match the query parameters.  The search is case-insensitive, supports fuzzy matching, and matches against provider name and NPI. The search criteria must be an alphanumeric string, and the search is limited to the first 20 results.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.search_providers(searchCriteria: 'search_criteria');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**search_criteria:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.get(id) -> Candid::PreEncounter::Patients::V1::Types::Patient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a patient.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.get_by_mrn(mrn) -> Candid::PreEncounter::Patients::V1::Types::Patient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a patient by mrn.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.get_by_mrn();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**mrn:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.get_history(id) -> Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Patient]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a patient along with it's full history.  The return list is ordered by version ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.get_history();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.update(id, version, request) -> Candid::PreEncounter::Patients::V1::Types::Patient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a patient. The path must contain the next version number to prevent race conditions. For example, if the current version of the patient is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the patient. Updating historic versions is not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.update({
  name: {
    family: 'family',
    given: ['given', 'given']
  },
  other_names: [{
    family: 'family',
    given: ['given', 'given']
  }, {
    family: 'family',
    given: ['given', 'given']
  }],
  birth_date: '2023-01-15',
  primary_address: {
    line: ['line', 'line'],
    city: 'city',
    state: 'state',
    postal_code: 'postal_code',
    country: 'country'
  },
  other_addresses: [{
    line: ['line', 'line'],
    city: 'city',
    state: 'state',
    postal_code: 'postal_code',
    country: 'country'
  }, {
    line: ['line', 'line'],
    city: 'city',
    state: 'state',
    postal_code: 'postal_code',
    country: 'country'
  }],
  other_telecoms: [{
    value: 'value'
  }, {
    value: 'value'
  }],
  contacts: [{
    relationship: [],
    name: {
      family: 'family',
      given: ['given', 'given']
    },
    telecoms: [{
      value: 'value'
    }, {
      value: 'value'
    }],
    addresses: [{
      line: ['line', 'line'],
      city: 'city',
      state: 'state',
      postal_code: 'postal_code',
      country: 'country'
    }, {
      line: ['line', 'line'],
      city: 'city',
      state: 'state',
      postal_code: 'postal_code',
      country: 'country'
    }]
  }, {
    relationship: [],
    name: {
      family: 'family',
      given: ['given', 'given']
    },
    telecoms: [{
      value: 'value'
    }, {
      value: 'value'
    }],
    addresses: [{
      line: ['line', 'line'],
      city: 'city',
      state: 'state',
      postal_code: 'postal_code',
      country: 'country'
    }, {
      line: ['line', 'line'],
      city: 'city',
      state: 'state',
      postal_code: 'postal_code',
      country: 'country'
    }]
  }],
  general_practitioners: [{
    name: {
      family: 'family',
      given: ['given', 'given']
    },
    telecoms: [{
      value: 'value'
    }, {
      value: 'value'
    }]
  }, {
    name: {
      family: 'family',
      given: ['given', 'given']
    },
    telecoms: [{
      value: 'value'
    }, {
      value: 'value'
    }]
  }],
  filing_order: {
    coverages: ['d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32', 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32']
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Patients::V1::Types::MutablePatient` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.deactivate(id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets a patient as deactivated.  The path must contain the most recent version plus 1 to prevent race conditions.  Deactivating historic versions is not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.deactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.reactivate(id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes the deactivated flag for a patient.  The path must contain the most recent version plus 1 to prevent race conditions.  Reactivating historic versions is not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.reactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.search() -> Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Patient]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of Patients based on the search criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.search();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**mrn:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**similar_name_ordering:** `String` — A string that is used to order similar names in search results.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.patients.v_1.scan() -> Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Patient]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Scans up to 1000 patient updates. The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.

**Polling Pattern:**
To continuously poll for updates without gaps:
1. Make your initial request with a `since` timestamp (e.g., `since=2020-01-01T13:00:00.000Z`)
2. The API returns 100 by default and up to 1000 patient records, sorted by `updated_at` ascending
3. Find the `updated_at` value from the last record in the response
4. Use that `updated_at` value as the `since` parameter in your next request
5. Repeat steps 2-4 to ingest updates until you receive an empty list

**Important Notes:**
- The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you can deduplicate by ID and version)
- All patient records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for tracking changes
- Timestamps have millisecond resolution for precise ordering
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.patients.v_1.scan(since: '2024-01-15T09:30:00Z');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**since:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**max_results:** `Integer` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PreEncounter Tags V1
<details><summary><code>client.pre_encounter.tags.v_1.get(id) -> Candid::PreEncounter::Tags::V1::Types::Tag</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets a tag by TagId.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.tags.v_1.get();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.tags.v_1.get_all() -> Candid::PreEncounter::Tags::V1::Types::TagPage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gets all tags. Defaults to page size of 1000.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.tags.v_1.get_all();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**page_token:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.tags.v_1.create(request) -> Candid::PreEncounter::Tags::V1::Types::Tag</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a new tag if it does not already exist, otherwise, returns the existing tag.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.tags.v_1.create({
  value: 'value'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::PreEncounter::Tags::V1::Types::MutableTag` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.tags.v_1.update(id, version, request) -> Candid::PreEncounter::Tags::V1::Types::Tag</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a tag. The path must contain the most recent version to prevent races.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.tags.v_1.update({
  value: 'value'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::PreEncounter::Tags::V1::Types::MutableTag` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.pre_encounter.tags.v_1.deactivate(id, version) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets a tag as deactivated.  The path must contain the most recent version to prevent races.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.pre_encounter.tags.v_1.deactivate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Diagnoses
<details><summary><code>client.diagnoses.create(request) -> Candid::Diagnoses::Types::Diagnosis</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new diagnosis for an encounter
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.diagnoses.create({
  encounter_id: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32',
  code: 'code'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Candid::Diagnoses::Types::StandaloneDiagnosisCreate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.diagnoses.update(diagnosis_id, request) -> Candid::Diagnoses::Types::Diagnosis</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the diagnosis record matching the provided `diagnosis_id`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.diagnoses.update(diagnosisId: 'd5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**diagnosis_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Empty string not allowed.
    
</dd>
</dl>

<dl>
<dd>

**code_type:** `Candid::Diagnoses::Types::DiagnosisTypeCode` — Typically, providers submitting claims to Candid are using ICD-10 diagnosis codes. If you are using ICD-10 codes, the primary diagnosis code listed on the claim should use the ABK code_type. If more than one diagnosis is being submitted on a claim, please use ABF for the rest of the listed diagnoses. If you are using ICD-9 diagnosis codes, use BK and BF for the principal and following diagnosis code(s) respectively.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` 

Empty string not allowed.
Should be of the appropriate format for the provided `code_type`.
Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
  - Letter
  - Digit
  - Digit or the letter `A` or `B`
  - (Optional) Period `.`
  - Up to 4 (or as few as 0) letters and digits
    
</dd>
</dl>

<dl>
<dd>

**present_on_admission_indicator:** `Candid::YesNoIndicator::Types::YesNoIndicator` 

For Institutional claims only.
A "Y" indicates that the onset occurred prior to admission to the hospital.
An "N" indicates that the onset did NOT occur prior to admission to the hospital.
A "U" indicates that it is unknown whether the onset occurred prior to admission to the hospital or not.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.diagnoses.delete(diagnosis_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the diagnosis record associated with the provided `diagnosis_id`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.diagnoses.delete();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**diagnosis_id:** `String` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ServiceFacility
<details><summary><code>client.service_facility.update(service_facility_id, request) -> Candid::ServiceFacility::Types::EncounterServiceFacility</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.service_facility.update({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**service_facility_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Candid::ServiceFacility::Types::EncounterServiceFacilityUpdate` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
