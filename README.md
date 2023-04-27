# teams-league-python-standard-beam

This video present a real world use case developed with Apache Beam Python and launched with the serverless Dataflow runner in Google Cloud Platform.

The job read a Json file from Cloud Storage, applies some transformations and write the result to a BigQuery table.

The link to the video that explains this use case.
- English : https://youtu.be/zAHl-YkFMWk
- French : https://youtu.be/eMfxbZN7P3g
## Run job with Dataflow runner :

### Batch

```
python -m team_league.application.team_league_app \
    --project=gb-poc-373711 \
    --project_id=gb-poc-373711 \
    --input_json_file=gs://mazlum_dev/team_league/input/json/input_teams_stats_raw.json \
    --job_name=team-league-python-job-$(date +'%Y-%m-%d-%H-%M-%S') \
    --runner=DataflowRunner \
    --staging_location=gs://mazlum_dev/dataflow/staging \
    --region=europe-west1 \
    --setup_file=./setup.py \
    --temp_location=gs://mazlum_dev/dataflow/temp \
    --team_league_dataset="mazlum_test" \
    --team_stats_table="team_stat" \
    --bq_write_method=FILE_LOADS
```

### Streaming

```
python -m team_league.application.team_league_app \
    --project=gb-poc-373711 \
    --project_id=gb-poc-373711 \
    --streaming \
    --input_json_file=gs://mazlum_dev/team_league/input/json/input_teams_stats_raw.json \
    --input_subscription=projects/gb-poc-373711/subscriptions/team_league \
    --job_name=team-league-python-job-$(date +'%Y-%m-%d-%H-%M-%S') \
    --runner=DataflowRunner \
    --staging_location=gs://mazlum_dev/dataflow/staging \
    --region=europe-west1 \
    --setup_file=./setup.py \
    --temp_location=gs://mazlum_dev/dataflow/temp \
    --team_league_dataset="mazlum_test" \
    --team_stats_table="team_stat" \
    --bq_write_method=STREAMING_INSERTS
```