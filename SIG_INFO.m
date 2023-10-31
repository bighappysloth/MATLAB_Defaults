function [s_rms,basefreq,spower,sfreq] = SIG_INFO(s,sampling_interval)
    % given oscilloscope samples in a list s, and sampling interval
    % we compute rms, the base frequency, and using periodogram FT
    % compute the power and frequency vector
    % Take the maximum of the magnitude of FT to find freq.
    [spower,sfreq]=periodogram(s,[],length(s),1/sampling_interval,'centered','power');
    [mag,in]=max(spower)
    basefreq=abs(sfreq(in));
%     size(sfreq)
%     sfreq(in)
%     disp(['freq: ',basefreq])
    % compute rms
    integral_period=1/basefreq;
    num_indices=floor(integral_period/sampling_interval);
    % compute truncated signal limited to 1 period
    try
        s_truncated = s(1:num_indices);
        % compute rms
        s_rms = norm(s_truncated)/sqrt(num_indices);
    catch E
        s_truncated= NaN; s_rms=NaN;
    end
end