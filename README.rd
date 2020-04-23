# Reproduction of Rollbar gem error during Rollbar outage

1. Start the sidekiq process: `bundle exec sidekiq -q default -r ./start_sidekiq.rb`
2. Run the script that throws an exception and reports Sidekiq queueus: `bundle exec ruby run.rb`


## Observed results without the patch:

```
Processed: 0, Failed: 0, retry size: 0, queues: {"default"=>1}
Processed: 0, Failed: 0, retry size: 0, queues: {"default"=>1}
Processed: 0, Failed: 0, retry size: 0, queues: {"default"=>1}
Processed: 0, Failed: 0, retry size: 48, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 173, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 256, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 382, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 507, queues: {"default"=>0}
Processed: 530, Failed: 530, retry size: 586, queues: {"default"=>0}
Processed: 530, Failed: 530, retry size: 709, queues: {"default"=>0}
Processed: 530, Failed: 530, retry size: 793, queues: {"default"=>0}
Processed: 835, Failed: 835, retry size: 835, queues: {"default"=>1}
```

## Observered results with the patch: (see Gemfile.lock)

```
Processed: 0, Failed: 0, retry size: 0, queues: {"default"=>1}
Processed: 0, Failed: 0, retry size: 0, queues: {"default"=>1}
Processed: 0, Failed: 0, retry size: 0, queues: {"default"=>1}
Processed: 0, Failed: 0, retry size: 1, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 1, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 1, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 1, queues: {"default"=>0}
Processed: 0, Failed: 0, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
Processed: 2, Failed: 1, retry size: 1, queues: {"default"=>0}
```
