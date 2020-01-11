# Musical Analyzer

## Dependencies

- Ruby (to run the tests)
- Docker

## Test and build

    bundle install --binstubs --path vendor/bundle
    bundle exec rspec --format doc

## Run

    docker run -it --rm serial-strokes/musical-analyzer
