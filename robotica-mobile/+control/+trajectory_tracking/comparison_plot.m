function comparison_plot(environment, evolutionAL, evolutionNL, evolutionFL)

    figure(); plot2D(environment);
    hold on; plot(evolutionAL(:,1), evolutionAL(:,2), "DisplayName",...
                  "trajectory output with approximated linearization");
    hold on; plot(evolutionNL(:,1), evolutionNL(:,2), "DisplayName",...
                          "trajectory output with non linear control");
    hold on; plot(evolutionFL(:,1), evolutionFL(:,2), "DisplayName",...
                        "trajectory output with input-output control");
    title("CONTROLS COMPARISON"); legend("Location","northwest");

end