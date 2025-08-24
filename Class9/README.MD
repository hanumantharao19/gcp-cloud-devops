# Difference between `gcloud auth activate-service-account` and `GOOGLE_APPLICATION_CREDENTIALS`

Both commands are related to authentication with Google Cloud but they
do different things.

------------------------------------------------------------------------

## 🔹 1. `gcloud auth activate-service-account --key-file="path/to/key-file.json"`

-   Activates the service account credentials for the **gcloud CLI**.
-   After running this, the `gcloud` command-line tool will use that
    service account for all operations.

Example:

``` bash
gcloud auth activate-service-account --key-file="hanu-terraform-key.json"
gcloud pubsub topics list   # uses the service account
```

👉 This affects **only the gcloud CLI session**, not Terraform or other
SDKs by default.

------------------------------------------------------------------------

## 🔹 2. `export GOOGLE_APPLICATION_CREDENTIALS="/path/to/key-file.json"`

-   Sets an **environment variable** that the **Google Cloud SDKs and
    Terraform provider** look for.
-   Terraform (or any app using Google client libraries) will
    automatically pick up this key file.

Example:

``` bash
export GOOGLE_APPLICATION_CREDENTIALS="/c/Users/Hanu Medikonda/Desktop/Devops/mhr_practice/hanu-terraform-key.json"
terraform apply   # this will use the service account
```

------------------------------------------------------------------------

## ⚡ Key Difference

-   **`gcloud auth activate-service-account`** → Only affects the
    `gcloud` CLI tool.\
-   **`GOOGLE_APPLICATION_CREDENTIALS`** → Used by **Terraform, Python
    scripts, Java apps, etc.** that rely on Google Cloud libraries.

------------------------------------------------------------------------

## ✅ Best Practice for Terraform

Set the environment variable before running Terraform:

``` bash
export GOOGLE_APPLICATION_CREDENTIALS="~/Desktop/Devops/mhr_practice/hanu-terraform-key.json"
terraform apply
```

------------------------------------------------------------------------
