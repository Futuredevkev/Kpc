import { cn } from "@/lib/utils";

interface LiveBadgeProps {
  className?: string;
};

export const LiveBadge = ({
  className,
}: LiveBadgeProps) => {
  return (
    <div className={cn(
      "bg-red-400 text-center p-0.5 px-1.5 rounded-md uppercase text-[10px] border border-background font-semibold tracking-wide",
      className,
    )}>
      Live
    </div>
  );
};