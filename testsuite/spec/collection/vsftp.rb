shared_examples 'collection::vsftp' do
    # services
    include_examples 'vsftp::listening::public'

    # test after services are up
    include_examples 'vsftp::user'
    include_examples 'vsftp::service::running'
end
