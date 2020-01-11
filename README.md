# Musical Analyzer

## Dependencies

- Ruby (to run the tests)
- Docker

## Run tests

    bundle install --binstubs --path vendor/bundle
    bundle exec rspec --format doc

## Build

    docker build -t serial-strokes/musical-analyzer .

## Run

    docker run -it --rm serial-strokes/musical-analyzer
