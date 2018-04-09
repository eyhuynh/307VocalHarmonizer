classdef gainreducer < audioPlugin
    
    properties        
        Gain = 1.0;
        zcrThresh = 0.25;
        unvoicedGain = 0.1;
    end
    
    properties (Access = private)
        
        zcrPrevious = [0 0];
        
    end
    
    properties (Constant)
        
        PluginInterface = audioPluginInterface(...
            audioPluginParameter('Gain', 'DisplayName', 'Gain',...
            'Mapping', {'lin',0.0,1.0}),...
            audioPluginParameter('zcrThresh', 'DisplayName', 'Zero Crossing Threshold',...
            'Mapping', {'lin',0.0,0.5}),...
            audioPluginParameter('unvoicedGain', 'DisplayName', 'Unvoiced Gain',...
            'Mapping', {'lin',0.0,1.0}))       
    end
 
    methods
        
        function out = process(plugin, in)    
            
            sIn = size(in);
            
            fadeOut = transpose( logspace( plugin.Gain, log10(plugin.unvoicedGain), length(in) ) );
            fadeOut = repmat(fadeOut, sIn(2));
            fadeIn = transpose( logspace( log10(plugin.unvoicedGain), plugin.Gain, length(in) ) );
            fadeIn = repmat(fadeIn, 1, sIn(2));
                        
            zcr = 0.5* mean ( abs( diff( sign(in ))));
            out1 = zeros(size(in));
            
            if zcr > plugin.zcrThresh
                if plugin.zcrPrevious > plugin.zcrThresh
                    out1 = in * plugin.unvoicedGain;
                elseif plugin.zcrPrevious < plugin.zcrThresh
                    out1 = in * fadeOut;
                end
                
            elseif zcr < plugin.zcrThresh
                if plugin.zcrPrevious < plugin.zcrThresh
                    out1 = in * plugin.Gain;
                elseif plugin.zcrPrevious > plugin.zcrThresh
                	out1 = in * fadeIn;
                end
            end
            out = out1 * plugin.Gain;
            
            plugin.zcrPrevious = zcr;             
        end        
    end       
end

        